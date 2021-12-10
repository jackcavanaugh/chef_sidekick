require "rails_helper"

RSpec.describe "ingredient_reviews#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/ingredient_reviews", payload
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
          type: "ingredient_reviews",
          attributes: params,
        },
      }
    end

    it "works" do
      expect(IngredientReviewResource).to receive(:build).and_call_original
      expect do
        make_request
        expect(response.status).to eq(201), response.body
      end.to change { IngredientReview.count }.by(1)
    end
  end
end
