module BuildRelationship
  extend ActiveSupport::Concern

  def buildrelation(following_id, _follower_id)
    if Follower.create(follower_id: following_id, following_id: current_user.id)
      flash[:success] = 'success'
      redirect_to user_index_path
    else
      flash[:danger] = 'failed'
    end
  end
end
