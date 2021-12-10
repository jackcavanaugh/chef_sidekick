require 'rails_helper'

RSpec.describe "supplier_reviews#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/supplier_reviews", payload
  end

  describe 'basic create' do
    let(:params) do
      {
        # ... your attrs here
      }
    end
    let(:payload) do
      {
        data: {
          type: 'supplier_reviews',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(SupplierReviewResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { SupplierReview.count }.by(1)
    end
  end
end
