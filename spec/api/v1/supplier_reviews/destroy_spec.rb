require 'rails_helper'

RSpec.describe "supplier_reviews#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/supplier_reviews/#{supplier_review.id}"
  end

  describe 'basic destroy' do
    let!(:supplier_review) { create(:supplier_review) }

    it 'updates the resource' do
      expect(SupplierReviewResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { SupplierReview.count }.by(-1)
      expect { supplier_review.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
