require 'rails_helper'

RSpec.describe ReviewsController, type: :controller do
  describe 'if user not sign in' do
    before do
      @review_params = build(:review)
    end
    
    # it 'create review' do
    #   expect {post :create, review: @review_params }.to change(Review, :count).by(1)
    # end
  end
end
