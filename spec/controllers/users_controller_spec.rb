# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { create(:user) }
  let(:user_two) { create(:user) }
  let(:admin) { create(:admin) }

  describe 'if user not sign in' do
    it 'not to render users page' do
      get :index
      expect(response).not_to render_template('index')
    end

    it 'not to render user page' do
      get :show, params: { id: user.id }
      expect(response).not_to render_template('show')
    end

    it 'not to render edit page' do
      get :edit, params: { id: user.id }
      expect(response).not_to render_template('edit')
    end
  end

  describe 'if user sign in like ordinary user' do
    before do
      user.confirm
      sign_in user
    end

    it 'not to render users page' do
      get :index
      expect(response).not_to render_template('index')
    end

    it 'render user page if this user page' do
      get :show, params: { id: user_two.id }
      expect(response).not_to render_template('show')
    end

    it "not to render  someone else's page" do
      get :show, params: { id: user_two.id }
      expect(response).not_to render_template('show')
    end

    it 'not to render edit page' do
      get :edit, params: { id: user.id }
      expect(response).not_to render_template('edit')
    end
  end

  describe 'if user sign in like admin' do
    before do
      admin.confirm
      sign_in admin
    end

    context 'action #index' do
      before do
        get :index
      end
      it 'render users page' do
        expect(response).to render_template('index')
      end

      it 'contain users' do
        expect(assigns(:users)).not_to be_nil
      end
    end

    context 'action #show' do
      before do
        get :show, params: { id: user.id }
      end

      it 'render user page' do
        expect(response).to render_template('show')
      end

      it 'contain user' do
        expect(assigns(:user)).to eq(user)
      end

      it 'dont contain other user' do
        expect(assigns(:user)).not_to eq(admin)
      end
    end

    context 'action #edit' do
      before do
        get :edit, params: { id: user.id }
      end

      it 'render edit page' do
        expect(response).to render_template('edit')
      end

      it 'contain user' do
        expect(assigns(:user)).to eq(user)
      end
    end

    context 'action #update' do
      it 'change user attributes and redirect to users page' do
        expected_value = 'Vasyl'
        put :update, params: { id: user.id, user: { nickname: expected_value } }
        expect(user.reload.nickname).to eq(expected_value)
        expect(response).to redirect_to action: :index
      end

      it "don't change incorrect name and redirect to edit" do
        put :update, params: { id: user.id, user: { nickname: nil } }
        expect(user.reload.nickname).not_to eq(nil)
        expect(response).to render_template('edit')
      end
    end

    context 'action #toggle_account_status' do
      it 'toggle user status and redirect to users page' do
        put :toggle_account_status, params: { id: user.id }
        expect(user.reload.active?).to be_falsy
        expect(response).to redirect_to action: :index
      end
    end
  end
end
