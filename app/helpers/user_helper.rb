# frozen_string_literal= true

module UserHelper
  def likes_on_post(post)
    current_user.likes.find_by(post: post)
  end
end
