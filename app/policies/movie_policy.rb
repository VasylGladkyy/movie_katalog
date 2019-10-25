class MoviePolicy < ApplicationPolicy
  attr_reader :movie, :record

  def index?
    true
  end

  def show?
    true
  end
end