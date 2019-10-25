require 'rails_helper'

RSpec.describe Admin::MoviesController do
  let(:user) { create(:user) }
  let(:admin) { create(:admin) }
  let(:movie) { create(:movie) }

  describe "if user not sign in" do
    it "not to render movies page" do
      get :index
      expect(response).not_to render_template("index")
    end

  end

  describe "if user sign in like ordinary user" do
    before do
      user.confirm
      sign_in user
    end

    it "not to render movies page" do
      get :index
      expect(response).not_to render_template("index")
    end
  end

  describe "if user sign in like admin" do
    before do
      admin.confirm
      sign_in admin
    end

    context 'action index' do
      before do
        get :index
      end
      
      it "render movies page" do
        expect(response).to render_template("index")
      end
     
    end
  end
end