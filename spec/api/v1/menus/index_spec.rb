require 'rails_helper'

RSpec.describe "menus#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/menus", params: params
  end

  describe 'basic fetch' do
    let!(:menu1) { create(:menu) }
    let!(:menu2) { create(:menu) }

    it 'works' do
      expect(MenuResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['menus'])
      expect(d.map(&:id)).to match_array([menu1.id, menu2.id])
    end
  end
end
