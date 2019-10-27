require 'rails_helper'

describe MoviesRefreshService do
  let (:movie) { create(:movie) }

  before do
    @obj = described_class.new
    @obj.call
  end

  describe 'use method call' do
    context 'variable omdb_ids' do
      it 'variable omdb_ids not nul' do
        expect(@obj.omdb_ids).not_to eq (nil)
      end

      it 'variable omdb_ids is array' do
        expect(@obj.omdb_ids).to be_kind_of(Array)
      end
    end

    context 'variable omdb_movies' do
      it 'variable omdb_movies not nul' do
        expect(@obj.omdb_movies).not_to eq (nil)
      end

      it 'variable omdb_movies is array' do
        expect(@obj.omdb_movies).to be_kind_of(Array)
      end
    end
  end
end
