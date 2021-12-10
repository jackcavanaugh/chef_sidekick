require 'rails_helper'

RSpec.describe "menus#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/menus/#{menu.id}", payload
  end

  describe 'basic update' do
    let!(:menu) { create(:menu) }

    let(:payload) do
      {
        data: {
          id: menu.id.to_s,
          type: 'menus',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(MenuResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { menu.reload.attributes }
    end
  end
end
