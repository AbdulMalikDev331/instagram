require 'rails_helper'
RSpec.describe Post, type: :model do
  describe 'associations' do
    it { should belong_to(:user).class_name('User') }
    it { should have_many_attached(:images) }
    it { should have_many(:likes).class_name('Like').dependent(:destroy) }
    it { should have_many(:comments).class_name('Comment').dependent(:destroy) }
  end

  describe 'validations' do
    it { should validate_presence_of(:description) }
    it { should validate_length_of(:description).is_at_least(3).is_at_most(90) }

    it 'must not have invalid type' do
      post = create(:post)
      post.images.attach(io: File.open(Rails.root.join('app/assets/images/invalid.pdf')),
                         filename: 'invalid.pdf')
      expect(post).not_to be_valid
    end
    it 'description must be min 3 characters' do
      post = build(:post, :short_description)
      expect(post).not_to be_valid
    end
    it 'description must be max 91 characters' do
      post = build(:post, :long_description)
      expect(post).not_to be_valid
    end
  end
end
