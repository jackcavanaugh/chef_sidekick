require "rails_helper"

RSpec.describe "business_accounts#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/business_accounts", params: params
  end

  describe "basic fetch" do
    let!(:business_account1) { create(:business_account) }
    let!(:business_account2) { create(:business_account) }

    it "works" do
      expect(BusinessAccountResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["business_accounts"])
      expect(d.map(&:id)).to match_array([business_account1.id,
                                          business_account2.id])
    end
  end
end
