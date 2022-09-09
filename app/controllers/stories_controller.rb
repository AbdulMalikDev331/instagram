# frozen_string_literal: true

class StoriesController < ApplicationController
  def create
    @story = current_user.stories.new(story_params)
    authorization
    respond_to do |format|
      if @story.save
        format.html { redirect_to user_index_path, notice: 'Story saved successfully' }
      else
        format.html { redirect_to new_story_path, notice: 'Story not saved' }
      end
    end
  end

  def new
    @story = Story.new
  end

  def destroy
    set_story
    authorization
    @story.destroy
  end

  def show
    set_user
    @strories = @user.stories
  end

  private

  def authorization
    authorize @story
  end

  def story_params
    params.require(:story).permit(:description, :storyimage)
  end

  def set_story
    @story = Story.find_by(id: params[:id])
    render_error('Story') if @story.nil?
  end

  def set_user
    @user = User.find_by(id: params[:id])
  end
end
