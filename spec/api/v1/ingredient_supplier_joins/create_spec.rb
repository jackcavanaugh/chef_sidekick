require 'rails_helper'

RSpec.describe "ingredient_supplier_joins#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/ingredient_supplier_joins", payload
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
          type: 'ingredient_supplier_joins',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(IngredientSupplierJoinResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { IngredientSupplierJoin.count }.by(1)
    end
  end
end
