class FollowerPolicy < ApplicationPolicy
  attr_reader :user, :follower

  def initialize(user, blog)
    super
    @user = user
    @follower = follower
  end

  def create?
    user.present?
  end

  def destroy?
    return true if user.id == record.follower_id
  end
end
