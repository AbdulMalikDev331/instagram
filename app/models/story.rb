# frozen_string_literal: true

class Story < ApplicationRecord
  belongs_to :user
  has_one_attached :storyimage
  validates :storyimage, presence: true, content_type: %i[png jpg jpeg]
  after_create :set_expiry

  private

  def set_expiry
    StoryExpiresJob.set(wait: 1.minute).perform_later(id)
  end

  scope :uniquestories, ->(user) { select(:user_id).distinct.includes(:user).where(user_id: user) }
end
