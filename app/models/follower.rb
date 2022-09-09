# frozen_string_literal: true

class Follower < ApplicationRecord
  validates :following_id, uniqueness: { scope: :follower_id }

  validate :not_equal
  def not_equal
    return unless following_id.eql?(follower_id)

    errors.add(:base, "Follower and following can't be same.")
  end

  scope :record_to_show, ->(user) { where(follower_id: user.id) }
end
