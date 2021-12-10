require "rails_helper"

RSpec.describe "recipe_ingredient_joins#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/recipe_ingredient_joins/#{recipe_ingredient_join.id}"
  end

  describe "basic destroy" do
    let!(:recipe_ingredient_join) { create(:recipe_ingredient_join) }

    it "updates the resource" do
      expect(RecipeIngredientJoinResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { RecipeIngredientJoin.count }.by(-1)
      expect { recipe_ingredient_join.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
