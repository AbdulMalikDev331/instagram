require 'rails_helper'

RSpec.describe Request, type: :model do
  describe 'associations' do
    it { should belong_to(:sender).class_name('User') }
    it { should belong_to(:recipient).class_name('User') }
  end

  describe 'validations' do
    it { should validate_presence_of(:status) }
    it { should validate_uniqueness_of(:recipient_id).scoped_to(:sender_id) }
  end
end
