require 'rails_helper'

RSpec.describe "business_accounts#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/business_accounts", payload
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
          type: 'business_accounts',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(BusinessAccountResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { BusinessAccount.count }.by(1)
    end
  end
end
