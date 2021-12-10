require 'rails_helper'

RSpec.describe "menus#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/menus/#{menu.id}", params: params
  end

  describe 'basic fetch' do
    let!(:menu) { create(:menu) }

    it 'works' do
      expect(MenuResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('menus')
      expect(d.id).to eq(menu.id)
    end
  end
end
