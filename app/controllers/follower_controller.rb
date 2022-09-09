# frozen_string_literal: true

class FollowerController < ApplicationController
  before_action :set_following_id
  def create
    respond_to do |format|
      @follower = current_user.followers.new(following_id: params[:follow_id])
      authorize @follower
      if @follower.save
        flash[:success] = 'Relation successfully build'
        format.html { redirect_to user_path(@following_id) }
      else
        flash[:danger] = 'Failed to create relation'
        format.html { redirect_to user_index_path(@following_id) }
      end
    end
  end

  def destroy
    @follower = current_user.followers.where(following_id: params[:id]).first
    if @follower.nil?
      flash[:danger] = 'Failed to destroy the relation'
    else
      authorize @follower
      @follower.destroy
      flash[:success] = 'Relation successfully destroyed'
    end
    redirect_to user_path
  end

  private

  def set_following_id
    @following_id = params[:follow_id]
  end
end
