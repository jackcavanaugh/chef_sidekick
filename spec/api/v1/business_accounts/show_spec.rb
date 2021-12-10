require "rails_helper"

RSpec.describe "business_accounts#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/business_accounts/#{business_account.id}",
                params: params
  end

  describe "basic fetch" do
    let!(:business_account) { create(:business_account) }

    it "works" do
      expect(BusinessAccountResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("business_accounts")
      expect(d.id).to eq(business_account.id)
    end
  end
end
