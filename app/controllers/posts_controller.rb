# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :set_post, only: %i[edit update destroy]
  before_action :authorization, only: %i[edit update destroy]
  def new
    @post = Post.new
    authorization
  end

  def create
    @post = current_user.posts.new(post_params)
    authorization
    respond_to do |format|
      if @post.save
        format.html { redirect_to user_index_path, notice: 'Post created successfully' }
      else
        flash[:danger] = 'Failed to create the post'
        format.html { redirect_to new_post_path }
      end
    end
  end

  def edit; end

  def update
    respond_to do |format|
      if @post.update(post_params)
        flash[:success] = 'Post updated successfully'
        format.html { redirect_to user_path(current_user) }

      else
        flash[:danger] = 'Failed to update the post'
        format.html { redirect_to edit_post_path(@post) }
      end
    end
  end

  def destroy
    if @post.destroy
      flash[:success] = 'post deleted succesfully!'
    else
      flash.now[:danger] = 'post not deleted!'
      redirect_to post_path(@post)
    end
  end

  def show; end

  private

  def authorization
    authorize @post
  end

  def post_params
    params.require(:post).permit(:description, images: [])
  end

  def set_post
    @post = Post.find_by(id: params[:id])
    render_error('Post') if @post.nil?
  end
end
