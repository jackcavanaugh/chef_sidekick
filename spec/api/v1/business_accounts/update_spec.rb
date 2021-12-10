require 'rails_helper'

RSpec.describe "business_accounts#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/business_accounts/#{business_account.id}", payload
  end

  describe 'basic update' do
    let!(:business_account) { create(:business_account) }

    let(:payload) do
      {
        data: {
          id: business_account.id.to_s,
          type: 'business_accounts',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(BusinessAccountResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { business_account.reload.attributes }
    end
  end
end
