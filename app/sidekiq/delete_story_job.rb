class DeleteStoryJob
  include Sidekiq::Job

  def perform(*args)
    @story = Story.find(args[0])
    if @story.destroy
      flash[:success] = 'Story Delete Sucessfully'
    else
      flash[:danger] = 'Unable to Delete Story'
    end
  end
end
