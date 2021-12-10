require 'rails_helper'

RSpec.describe "ingredient_reviews#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/ingredient_reviews/#{ingredient_review.id}", params: params
  end

  describe 'basic fetch' do
    let!(:ingredient_review) { create(:ingredient_review) }

    it 'works' do
      expect(IngredientReviewResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('ingredient_reviews')
      expect(d.id).to eq(ingredient_review.id)
    end
  end
end
