class UserPolicy < ApplicationPolicy
  attr_reader :user, :record

  def index?
    user.admin?
  end

  def show?
    user.admin? || user.id == record.id
  end

  def update?
    user.admin?
  end

  def toggle_account_status?
    user.admin?
  end
end
