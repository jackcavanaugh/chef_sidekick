require 'rails_helper'

RSpec.describe "ingredient_suppliers#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/ingredient_suppliers/#{ingredient_supplier.id}", payload
  end

  describe 'basic update' do
    let!(:ingredient_supplier) { create(:ingredient_supplier) }

    let(:payload) do
      {
        data: {
          id: ingredient_supplier.id.to_s,
          type: 'ingredient_suppliers',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(IngredientSupplierResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { ingredient_supplier.reload.attributes }
    end
  end
end
