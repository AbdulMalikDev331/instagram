# frozen_string_literal: true

class Request < ApplicationRecord
  belongs_to :sender, class_name: 'User'
  belongs_to :recipient, class_name: 'User'
  validates :recipient_id, uniqueness: { scope: :sender_id }
  validates :status, presence: true

  scope :accepted_sent_requests, -> { where(status: 'accepted') }
  scope :pending_requests_recieved, ->(user) { where(recipient_id: user.id, status: 'pending') }
end
