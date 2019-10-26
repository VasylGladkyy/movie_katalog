# frozen_string_literal: true

require 'rails_helper'

describe MoviesRefreshService do
  before do
    @obj = MoviesRefreshService.new
    @obj.call
  end

  context 'when condition' do
    it 'succeeds' do
    end
  end
end
