require "rails_helper"

RSpec.describe "recipe_ingredient_joins#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/recipe_ingredient_joins", params: params
  end

  describe "basic fetch" do
    let!(:recipe_ingredient_join1) { create(:recipe_ingredient_join) }
    let!(:recipe_ingredient_join2) { create(:recipe_ingredient_join) }

    it "works" do
      expect(RecipeIngredientJoinResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["recipe_ingredient_joins"])
      expect(d.map(&:id)).to match_array([recipe_ingredient_join1.id,
                                          recipe_ingredient_join2.id])
    end
  end
end
