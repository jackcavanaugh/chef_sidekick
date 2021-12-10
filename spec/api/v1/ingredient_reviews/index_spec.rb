require 'rails_helper'

RSpec.describe "ingredient_reviews#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/ingredient_reviews", params: params
  end

  describe 'basic fetch' do
    let!(:ingredient_review1) { create(:ingredient_review) }
    let!(:ingredient_review2) { create(:ingredient_review) }

    it 'works' do
      expect(IngredientReviewResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['ingredient_reviews'])
      expect(d.map(&:id)).to match_array([ingredient_review1.id, ingredient_review2.id])
    end
  end
end
