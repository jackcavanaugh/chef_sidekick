require 'rails_helper'

RSpec.describe "supplier_reviews#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/supplier_reviews", params: params
  end

  describe 'basic fetch' do
    let!(:supplier_review1) { create(:supplier_review) }
    let!(:supplier_review2) { create(:supplier_review) }

    it 'works' do
      expect(SupplierReviewResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['supplier_reviews'])
      expect(d.map(&:id)).to match_array([supplier_review1.id, supplier_review2.id])
    end
  end
end
