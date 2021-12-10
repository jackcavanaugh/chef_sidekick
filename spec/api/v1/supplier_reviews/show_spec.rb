require 'rails_helper'

RSpec.describe "supplier_reviews#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/supplier_reviews/#{supplier_review.id}", params: params
  end

  describe 'basic fetch' do
    let!(:supplier_review) { create(:supplier_review) }

    it 'works' do
      expect(SupplierReviewResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('supplier_reviews')
      expect(d.id).to eq(supplier_review.id)
    end
  end
end
