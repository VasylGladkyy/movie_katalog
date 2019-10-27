class MoviePolicy < ApplicationPolicy
  attr_reader :movie, :record

  def index?
    true
  end

  def show?
    true
  end

  def add_to_watch_later?
    user.present?
  end
end