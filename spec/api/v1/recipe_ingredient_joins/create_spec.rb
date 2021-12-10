require "rails_helper"

RSpec.describe "recipe_ingredient_joins#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/recipe_ingredient_joins", payload
  end

  describe "basic create" do
    let(:params) do
      {
        # ... your attrs here
      }
    end
    let(:payload) do
      {
        data: {
          type: "recipe_ingredient_joins",
          attributes: params,
        },
      }
    end

    it "works" do
      expect(RecipeIngredientJoinResource).to receive(:build).and_call_original
      expect do
        make_request
        expect(response.status).to eq(201), response.body
      end.to change { RecipeIngredientJoin.count }.by(1)
    end
  end
end
