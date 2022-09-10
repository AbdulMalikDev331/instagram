require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:user) { create(:user) }
  let(:post1) { create(:post, user: user) }
  let(:current_user) { create(:user) }
  let(:my_post) { create(:post, user: current_user) }
  before_count = Post.count

  before :each do
    sign_in current_user
  end

  describe 'GET new' do
    context 'new post form' do
      it 'respond with new post form' do
        get :new
        expect(response.status).to eq(200)
      end
    end
    context 'when user is not signed in' do
      it 'User needs to be signed in error code: 302' do
        sign_out current_user
        get :new
        expect(response.status).to eq(302)
      end
    end
  end

  describe 'POST create' do
    context 'when new post created' do
      description = Faker::Lorem.sentence
      let(:params) do
        {
          post: {
            description: description
          }
        }
      end
      it 'respond with successful creation if new post created' do
        post :create, params: params

        expect(flash[:notice]).to eq('Post created successfully')
      end
      it 'should increase the post count' do
        post :create, params: params

        expect(Post.count).not_to eq(before_count)
      end
      it 'redirects user index page on successful creation of new Post' do
        post :create, params: params

        expect(response).to redirect_to(user_index_path)
      end
    end

    context 'when params are invalid' do
      let(:params) do
        {
          post: {
            description: ''
          }
        }
      end
      it 'responds with errors' do
        post :create, params: params

        expect(flash[:danger]).to eq('Failed to create the post')
      end
      it 'redirects to new post form' do
        post :create, params: params

        expect(response).to redirect_to(new_post_path)
      end
      it 'should not increase the post count' do
        post :create, params: params

        expect(Post.count).to eq(before_count)
      end
    end
    context 'when user is not signed in' do
      description = Faker::Lorem.sentence
      let(:params) do
        {
          post: {
            description: description
          }
        }
      end
      it 'respond with status user not signin' do
        sign_out current_user
        post :create, params: params

        expect(response.status).to eq(302)
      end
      it 'should increase the post count' do
        sign_out current_user
        post :create, params: params

        expect(Post.count).to eq(before_count)
      end
    end
  end
  describe 'GET edit' do
    context 'when edit form opened' do
      it 'User can edit successfully' do
        get :edit, params: { id: my_post.id }

        expect(response.status).to eq(200)
      end
    end
    context 'when user is not authorized' do
      it 'Only post owner can edit the blog!' do
        get :edit, params: { id: post1.id }

        expect(response.status).to eq(302)
      end
    end
    context 'when user is not signed in' do
      it 'User needs to be signed in error code: 401' do
        sign_out current_user
        get :edit, params: { id: post1.id }

        expect(response.status).to eq(302)
      end
    end
  end
  describe 'PATCH update' do
    context 'when post update is success' do
      description = Faker::Lorem.sentence
      let(:params) do
        {
          id: my_post.id,
          user_id: current_user.id,
          post: {
            description: description
          }
        }
      end
      it 'respond with success if update operation successful' do
        patch :update, params: params

        expect(flash[:success]).to eq('Post updated successfully')
      end
      it 'redirects to user path if update operation successful' do
        patch :update, params: params

        expect(response).to redirect_to(user_path(current_user))
      end
    end
    context 'when params are invalid' do
      let(:params) do
        {
          id: my_post.id,
          user_id: current_user.id,
          post: {
            description: ''
          }
        }
      end
      it 'respond with error if post not updated' do
        patch :update, params: params

        expect(flash[:danger]).to eq('Failed to update the post')
      end
      it 'redirects to edit post path if post not updated' do
        patch :update, params: params

        expect(response).to redirect_to(edit_post_path(my_post))
      end
    end
    context 'when user is not authorized ' do
      description = Faker::Lorem.sentence
      let(:params) do
        {
          id: post1.id,
          user_id: current_user.id,
          post: {
            description: description
          }
        }
      end
      it 'respond with error only owner can update post' do
        patch :update, params: params

        expect(flash.keys).to eq(['alert'])
      end
    end
    context 'when user is not signed in' do
      description = Faker::Lorem.sentence
      let(:params) do
        {
          id: my_post.id,
          post: {
            description: description
          }
        }
      end
      it 'respond with error user must signin' do
        sign_out current_user
        patch :update, params: params

        expect(response.status).to eq(302)
      end
    end
  end
  describe 'DELETE destroy' do
    context 'when post successfully deleted' do
      let(:params) do
        {
          id: my_post.id
        }
      end
      it 'respond with success if post deleted' do
        delete :destroy, params: params, format: :js

        expect(flash[:success]).to eq('post deleted succesfully!')
      end
    end
    context 'when post deletion unsuccessfull' do
      let(:params) do
        {
          id: my_post.id
        }
      end
      it 'will flash to danger if post is not deleted' do
        allow_any_instance_of(Post).to receive(:destroy).and_return(false)
        delete :destroy, params: params

        expect(flash[:danger]).to eq('post not deleted!')
      end
      it 'will redirect to post path if post is not deleted' do
        allow_any_instance_of(Post).to receive(:destroy).and_return(false)
        delete :destroy, params: params

        expect(response).to redirect_to(post_path(my_post))
      end
    end
    context 'when user is not authorized ' do
      it 'only post owner can delete the post!' do
        delete :destroy, params: { id: post1.id }

        expect(flash.keys).to eq(['alert'])
      end
    end
    context 'when user is not signed in' do
      it 'respond with error user must signin' do
        sign_out current_user
        delete :destroy, params: { id: post1.id }, format: :js

        expect(response.status).to eq(401)
      end
    end
  end
end
