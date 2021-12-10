require "rails_helper"

RSpec.describe "recipe_menu_joins#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/recipe_menu_joins/#{recipe_menu_join.id}",
                params: params
  end

  describe "basic fetch" do
    let!(:recipe_menu_join) { create(:recipe_menu_join) }

    it "works" do
      expect(RecipeMenuJoinResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("recipe_menu_joins")
      expect(d.id).to eq(recipe_menu_join.id)
    end
  end
end
