require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'associations' do
    it { should belong_to(:user).class_name('User') }
    it { should belong_to(:post).class_name('Post') }
  end

  describe 'validations' do
    it { should validate_presence_of(:comment) }
    it { should validate_length_of(:comment).is_at_least(3).is_at_most(90) }
    it 'Comment must be min 3 characters' do
      comment = build(:comment, :comment_short_body)
      expect(comment).not_to be_valid
    end
    it 'Comment must be max 90 characters' do
      comment = build(:comment, :comment_long_body)
      expect(comment).not_to be_valid
    end
  end
end
