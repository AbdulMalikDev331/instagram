# frozen_string_literal: true

require 'rails_helper'
RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many(:posts).class_name('Post').dependent(:destroy) }
    it { should have_many(:likes).class_name('Like').dependent(:destroy) }
    it { should have_many(:comments).class_name('Comment').dependent(:destroy) }
    it { should have_many(:stories).class_name('Story').dependent(:destroy) }
    it { should have_many(:followers).class_name('Follower') }
    it { should have_many(:followings).class_name('Follower') }
    it { should have_many(:requests_recieved).class_name('Request').dependent(:destroy) }
    it { should have_many(:requests_sent).class_name('Request').dependent(:destroy) }
    it { should have_one_attached(:profile_pic) }
  end

  describe 'validations' do
    valid_username = Faker::Alphanumeric.alphanumeric(number: 10, min_alpha: 3)
    valid_fullname = Faker::Name.first_name
    invalid_fullname = Faker::Alphanumeric.alphanumeric(number: 10, min_numeric: 3)
    invalid_username = Faker::Lorem.sentence

    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:fullname) }
    it { should validate_length_of(:username).is_at_least(2).is_at_most(25) }
    it { should validate_uniqueness_of(:username) }
    it { should validate_length_of(:fullname).is_at_least(2).is_at_most(25) }
    it { should allow_value(valid_fullname).for(:fullname) }
    it { should_not allow_value(invalid_fullname).for(:fullname) }
    it { should allow_value(valid_username).for(:username) }
    it { should_not allow_value(invalid_username).for(:username) }

    it 'user is valid' do
      user = create(:user)
      expect(user).to be_valid
    end
    it 'email must be present' do
      user = build(:user, :null_email)
      expect(user).not_to be_valid
    end
    it 'password must be present' do
      user = build(:user, :null_password)
      expect(user).not_to be_valid
    end
    it 'password must be min 6 characters' do
      user = build(:user, :short_password)
      expect(user).not_to be_valid
    end
    it 'Image must be of valid type' do
      user = create(:user, :invalid_image)
      expect(user).not_to be_valid
    end
    it 'username must be min 2 characters' do
      user = build(:user, :short_username)
      expect(user).not_to be_valid
    end
    it 'username must be max 25 characters' do
      user = build(:user, :long_username)
      expect(user).not_to be_valid
    end
    it 'fullname must be min 2 characters' do
      user = build(:user, :short_fullname)
      expect(user).not_to be_valid
    end
    it 'fullname must be max 25 characters' do
      user = build(:user, :long_fullname)
      expect(user).not_to be_valid
    end
    it 'fullname must be of valid format' do
      user = build(:user, :invalid_fullname)
      expect(user).not_to be_valid
    end
  end

  describe 'methods' do
    let(:user) { create(:user) }

    it 'finds a searched user by name' do
      @result = User.text_search(user.username)
      expect(@result).to eq([user])
    end
    it 'finds a  followed user id' do
      result = User.followed_user_ids(user)
      expect(result).not_to eq(nil)
    end
    it 'total no of followers of user' do
      expect(user.total_followers).to eq(0)
    end
    it 'total no of following of user' do
      expect(user.total_following).to eq(0)
    end
  end

  describe 'callbacks' do
    it { should callback(:send_welcome_mail).after(:create) }
  end
end
