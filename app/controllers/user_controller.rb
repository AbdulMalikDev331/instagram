# frozen_string_literal: true

class UserController < ApplicationController
  before_action :set_user, only: [:show]
  before_action :set_comment, only: [:index]
  before_action :set_stories, only: [:index]

  def index
    followers_ids = follower_ids(current_user)
    @allposts = Post.allposts(:user, followers_ids)
    @uniqstory = Story.uniquestories(followers_ids)
    @requests = Request.pending_requests_recieved(current_user)
  end

  def show
    @posts = @user.posts
    @followers = Follower.record_to_show(current_user).map(&:following_id)
    @users = User.all
  end

  def search
    @users = User.text_search(params[:q])
  end

  private

  def set_user
    @user = User.find_by(id: params[:id])
  end

  def follower_ids(user)
    ids = Follower.record_to_show(user).map(&:following_id)
    ids << user.id
  end

  def set_comment
    @comment = Comment.new
  end

  def set_stories
    @stories = Story.order(created_at: :asc)
  end
end
