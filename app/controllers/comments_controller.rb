# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_user, only: %i[edit destroy]
  before_action :set_post
  before_action :set_comment, only: %i[edit update destroy]
  before_action :authorization, only: %i[edit update destroy]
  def create
    @comment = current_user.comments.new(comment_params)
    authorization
    respond_to do |format|
      if @comment.save
        format.js
      else
        format.html { redirect_to user_index_path }
      end
    end
  end

  def destroy
    authorization
    @comment.destroy
  end

  def edit; end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.js
      else
        format.html { redirect_to root_path, alert: 'something went wrong in updating comment.' }
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :post_id).merge(post_id: params[:post_id])
  end

  def set_user
    @user = User.find_by(id: params[:user_id])
  end

  def set_post
    @post = Post.find_by(id: params[:post_id])
  end

  def set_comment
    @comment = current_user.comments.find_by(id: params[:id])
    @comment.nil? ? render_error('Comment') : authorize(@comment)
  end

  def authorization
    authorize @comment
  end
end
