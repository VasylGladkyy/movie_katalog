class Admin::MoviePolicy < ApplicationPolicy
  def index?
    user.admin?
  end

  def create?
    user.admin?
  end
  
  def new?
    user.admin?
  end
end

