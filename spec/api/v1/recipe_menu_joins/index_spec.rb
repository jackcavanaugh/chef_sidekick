require "rails_helper"

RSpec.describe "recipe_menu_joins#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/recipe_menu_joins", params: params
  end

  describe "basic fetch" do
    let!(:recipe_menu_join1) { create(:recipe_menu_join) }
    let!(:recipe_menu_join2) { create(:recipe_menu_join) }

    it "works" do
      expect(RecipeMenuJoinResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["recipe_menu_joins"])
      expect(d.map(&:id)).to match_array([recipe_menu_join1.id,
                                          recipe_menu_join2.id])
    end
  end
end
