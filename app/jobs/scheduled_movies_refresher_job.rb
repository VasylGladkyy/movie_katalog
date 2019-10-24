class ScheduledMoviesRefresherJob < ApplicationJob
  queue_as :default

  def perform
    MoviesRefreshService.new.call
  end
end
