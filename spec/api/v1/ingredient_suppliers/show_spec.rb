require "rails_helper"

RSpec.describe "ingredient_suppliers#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/ingredient_suppliers/#{ingredient_supplier.id}",
                params: params
  end

  describe "basic fetch" do
    let!(:ingredient_supplier) { create(:ingredient_supplier) }

    it "works" do
      expect(IngredientSupplierResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("ingredient_suppliers")
      expect(d.id).to eq(ingredient_supplier.id)
    end
  end
end
