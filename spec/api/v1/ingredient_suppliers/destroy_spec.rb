require 'rails_helper'

RSpec.describe "ingredient_suppliers#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/ingredient_suppliers/#{ingredient_supplier.id}"
  end

  describe 'basic destroy' do
    let!(:ingredient_supplier) { create(:ingredient_supplier) }

    it 'updates the resource' do
      expect(IngredientSupplierResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { IngredientSupplier.count }.by(-1)
      expect { ingredient_supplier.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
