require 'rails_helper'

RSpec.describe "supplier_reviews#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/supplier_reviews/#{supplier_review.id}", payload
  end

  describe 'basic update' do
    let!(:supplier_review) { create(:supplier_review) }

    let(:payload) do
      {
        data: {
          id: supplier_review.id.to_s,
          type: 'supplier_reviews',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(SupplierReviewResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { supplier_review.reload.attributes }
    end
  end
end
