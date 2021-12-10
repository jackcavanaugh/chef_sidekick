require "rails_helper"

RSpec.describe "ingredient_reviews#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/ingredient_reviews/#{ingredient_review.id}"
  end

  describe "basic destroy" do
    let!(:ingredient_review) { create(:ingredient_review) }

    it "updates the resource" do
      expect(IngredientReviewResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { IngredientReview.count }.by(-1)
      expect { ingredient_review.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
