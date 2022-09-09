# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :stories, dependent: :destroy
  has_many :followers, foreign_key: 'follower_id'
  has_many :followings, foreign_key: 'following_id',
                        class_name: 'Follower'
  has_one_attached :profile_pic
  has_many :requests_recieved, foreign_key: 'recipient_id',
                               class_name: 'Request',
                               dependent: :destroy,
                               inverse_of: 'recipient'
  has_many :requests_sent, foreign_key: 'sender_id',
                           class_name: 'Request',
                           dependent: :destroy,
                           inverse_of: 'sender'
  after_create :send_welcome_mail
  validates :username, presence: true, uniqueness: true, format: { with: /\A[a-z0-9._ -]+\z/ }, length: { in: 2..25 }
  validates :fullname, presence: true, format: { with: /\A[a-zA-Z ]+\z/, message: 'only allows letters' }, length: { in: 2..25 }
  validates :profile_pic, content_type: %i[png jpg jpeg]

  def total_following
    Follower.where(following_id: id).count
  end

  def total_followers
    Follower.where(follower_id: id).count
  end

  def send_welcome_mail
    UserMailer.send_user_welcome_mail(self).deliver_now!
  end

  scope :records_to_show, ->(user) { where(user_id: FollowedUsers.followed_user_ids(user)).order(updated_at: :desc) }

  def self.followed_user_ids(user)
    followers_ids = Follower.where(follower_id: user.id).map(&:following_id)
    followers_ids << user.id
  end

  def self.text_search(query)
    return find_name(query) if query.present?
  end

  scope :find_name, ->(query) { where('email ILIKE :q or username ILIKE :q or fullname ILIKE  :q ', q: query) }
end
