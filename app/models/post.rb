# frozen_string_literal: true

class Post < ApplicationRecord
  has_many_attached :images
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  belongs_to :user
  validates :images, content_type: %i[png jpg jpeg]
  validates :description, presence: true, length: { minimum: 3, maximum: 90 }
  scope :allposts, ->(currentuser, followers_id) { order(created_at: :DESC).includes(currentuser).where(user_id: followers_id) }
end
