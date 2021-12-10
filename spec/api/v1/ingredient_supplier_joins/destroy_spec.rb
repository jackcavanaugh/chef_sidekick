require "rails_helper"

RSpec.describe "ingredient_supplier_joins#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/ingredient_supplier_joins/#{ingredient_supplier_join.id}"
  end

  describe "basic destroy" do
    let!(:ingredient_supplier_join) { create(:ingredient_supplier_join) }

    it "updates the resource" do
      expect(IngredientSupplierJoinResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { IngredientSupplierJoin.count }.by(-1)
      expect { ingredient_supplier_join.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
