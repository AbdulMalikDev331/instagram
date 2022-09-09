require 'rails_helper'

RSpec.describe Story, type: :model do
  describe 'associations' do
    it { should belong_to(:user).class_name('User') }
    it { should have_one_attached(:storyimage) }
  end
  describe 'validations' do
    it { should validate_presence_of(:storyimage) }

    it 'must be of valid image type' do
      story = create(:story, :story_invalid_image)
      expect(story).not_to be_valid
    end
    it 'is valid story' do
      story = create(:story)
      expect(story).to be_valid
    end
  end

  describe 'callbacks' do
    it { should callback(:set_expiry).after(:create) }
  end
end
