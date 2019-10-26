class ReviewPolicy < ApplicationPolicy
  def edit?
    user.admin? || user.id == record.user_id
  end

  def create?
    user.present?
  end

  def update?
    edit?
  end

  def destroy?
    user.admin? || user.id == record.user_id
  end
end
