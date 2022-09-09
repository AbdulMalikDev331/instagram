class PostPolicy < ApplicationPolicy
  def new?
    user.present?
  end

  def create?
    user_is_owner_of_record?
  end

  def edit?
    user_is_owner_of_record?
  end

  def update?
    user_is_owner_of_record?
  end

  def destroy?
    user_is_owner_of_record?
  end

  private

  def user_is_owner_of_record?
    user == record.user
  end
end
