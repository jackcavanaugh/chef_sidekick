require "rails_helper"

RSpec.describe "ingredient_supplier_joins#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/ingredient_supplier_joins", params: params
  end

  describe "basic fetch" do
    let!(:ingredient_supplier_join1) { create(:ingredient_supplier_join) }
    let!(:ingredient_supplier_join2) { create(:ingredient_supplier_join) }

    it "works" do
      expect(IngredientSupplierJoinResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["ingredient_supplier_joins"])
      expect(d.map(&:id)).to match_array([ingredient_supplier_join1.id,
                                          ingredient_supplier_join2.id])
    end
  end
end
