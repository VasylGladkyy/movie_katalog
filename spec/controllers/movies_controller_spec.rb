require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  let (:movie) { create(:movie) }
  before do
    @user = create(:user)
    @user.confirm
    sign_in @user
  end

  describe 'action #index' do
    it 'Render movies page' do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe 'action #show' do
    it 'Render movie page' do
      get :show, params: { id: movie.id }
      expect(response).to render_template('show')
    end
  end
end
