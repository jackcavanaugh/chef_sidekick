require 'rails_helper'

RSpec.describe "business_accounts#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/business_accounts/#{business_account.id}"
  end

  describe 'basic destroy' do
    let!(:business_account) { create(:business_account) }

    it 'updates the resource' do
      expect(BusinessAccountResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { BusinessAccount.count }.by(-1)
      expect { business_account.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
