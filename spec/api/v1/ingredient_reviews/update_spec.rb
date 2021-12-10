require "rails_helper"

RSpec.describe "ingredient_reviews#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/ingredient_reviews/#{ingredient_review.id}", payload
  end

  describe "basic update" do
    let!(:ingredient_review) { create(:ingredient_review) }

    let(:payload) do
      {
        data: {
          id: ingredient_review.id.to_s,
          type: "ingredient_reviews",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(IngredientReviewResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { ingredient_review.reload.attributes }
    end
  end
end
