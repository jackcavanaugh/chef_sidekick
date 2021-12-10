require "rails_helper"

RSpec.describe "ingredient_supplier_joins#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/ingredient_supplier_joins/#{ingredient_supplier_join.id}",
                params: params
  end

  describe "basic fetch" do
    let!(:ingredient_supplier_join) { create(:ingredient_supplier_join) }

    it "works" do
      expect(IngredientSupplierJoinResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("ingredient_supplier_joins")
      expect(d.id).to eq(ingredient_supplier_join.id)
    end
  end
end
