class CommentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    user_is_owner_of_record?
  end

  def edit?
    user_is_owner_of_post? && user_is_owner_of_record?
  end

  def update?
    user_is_owner_of_post? && user_is_owner_of_record?
  end

  def destroy?
    user_is_owner_of_post? && user_is_owner_of_record?
  end

  private

  def user_is_owner_of_record?
    user == record.user
  end

  def user_is_owner_of_post?
    user == record.post.user
  end
end
