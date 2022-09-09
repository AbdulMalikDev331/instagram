# frozen_string_literal: true

class LikesController < ApplicationController
  def create
    @like = current_user.likes.new(like_params)
    authorization
    if @like.save
      flash[:success] = 'Liked successfully'
    else
      flash[:danger] = @like.errors.full_messages.to_sentence
    end
  end

  def destroy
    @like = current_user.likes.find(params[:id])
    authorization
    @like.destroy
  end

  private

  def authorization
    authorize @like
  end

  def like_params
    params.require(:like).permit(:post_id)
  end
end
