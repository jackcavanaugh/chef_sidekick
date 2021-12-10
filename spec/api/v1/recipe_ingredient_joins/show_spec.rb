require 'rails_helper'

RSpec.describe "recipe_ingredient_joins#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/recipe_ingredient_joins/#{recipe_ingredient_join.id}", params: params
  end

  describe 'basic fetch' do
    let!(:recipe_ingredient_join) { create(:recipe_ingredient_join) }

    it 'works' do
      expect(RecipeIngredientJoinResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('recipe_ingredient_joins')
      expect(d.id).to eq(recipe_ingredient_join.id)
    end
  end
end
