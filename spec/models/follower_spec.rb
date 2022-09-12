require 'rails_helper'

RSpec.describe Follower, type: :model do
  describe 'validations' do
    it { should validate_uniqueness_of(:following_id).scoped_to(:follower_id) }
  end

  describe 'custom validations' do
    let(:user) { create(:user) }
    let(:user1) { create(:user) }
    it 'follower and following id should not be equal' do
      expect(user).not_to eq(user1)
    end
  end
end
