require 'rails_helper'

RSpec.describe FollowerController, type: :controller do
  let(:user) { create(:user) }
  let(:current_user) { create(:user) }

  before :each do
    sign_in current_user
  end

  describe 'POST create' do
    context 'when relation successfully created' do
      let(:params) do
        {
          follow_id: user.id
        }
      end
      it 'respond with successful creation of new relation' do
        post :create, params: params
        expect(flash.keys).to eq(['success'])
      end
      it 'redirects to user profile with successful creation of new relation' do
        post :create, params: params
        expect(response).to redirect_to(user_path(user.id))
      end
    end
    context 'when invalid params passed' do
      it 'respond with unsuccessful behaviour' do
        post :create, params: { follow_id: current_user.id }
        expect(flash.keys).to eq(['danger'])
      end
    end
    context 'when user is not signed in' do
      it 'respond with status user not signin' do
        sign_out current_user
        post :create, params: { follow_id: '' }
        expect(response.status).to eq(302)
      end
    end
  end
  describe 'DELETE destroy' do
    let(:rel) { Follower.create(following_id: user.id, follower_id: current_user.id) }
    context 'when relation successfully deleted' do
      let(:params) do
        {
          id: rel.following_id
        }
      end
      it 'respond with deleted follower/unfollow' do
        delete :destroy, params: params
        expect(flash.keys).to eq(['success'])
      end
      it 'redirects to user page when deleted/unfollow' do
        delete :destroy, params: params
        expect(response).to redirect_to(user_path)
      end
    end
    context 'when invalid params passed' do
      let(:params) do
        {
          id: rel.follower_id
        }
      end
      it 'respond with unsuccessful behaviour' do
        delete :destroy, params: params
        expect(flash.keys).to eq(['danger'])
      end
      it 'redirects to user page when not deleted/unfollow' do
        delete :destroy, params: params
        expect(response).to redirect_to(user_path)
      end
    end
    context 'when user is not signed in' do
      it 'respond with status user not signin' do
        sign_out current_user
        post :create, params: { follow_id: current_user.id }
        expect(response.status).to eq(302)
      end
    end
    context 'when user is not authorized' do
      it 'respond with status user not signin' do
        sign_out current_user
        post :create, params: { follow_id: current_user.id }
        expect(response.status).to eq(302)
      end
    end
  end
end
