require "rails_helper"

RSpec.describe "recipe_menu_joins#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/recipe_menu_joins/#{recipe_menu_join.id}"
  end

  describe "basic destroy" do
    let!(:recipe_menu_join) { create(:recipe_menu_join) }

    it "updates the resource" do
      expect(RecipeMenuJoinResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { RecipeMenuJoin.count }.by(-1)
      expect { recipe_menu_join.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
