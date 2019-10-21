# frozen_string_literal: true

class OmdbClient
  include Singleton
  def initialize
    @api_key = Rails.application.credentials[:omdb][:api_key]
    @root_url = 'http://www.omdbapi.com'
  end

  def by_id(id:)
    all(i: String(id))
  end

  def by_title(title:)
    all(t: String(title))
  end

  def by_id_and_title(id:, title:)
    all(i: String(id), t: String(title))
  end

  private

  def base_params
    { apikey: @api_key }
  end

  def all(search_params = {})
    RestClient.get(@root_url, params: search_params.merge!(base_params))
  end
end
