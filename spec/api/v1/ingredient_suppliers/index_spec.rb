require "rails_helper"

RSpec.describe "ingredient_suppliers#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/ingredient_suppliers", params: params
  end

  describe "basic fetch" do
    let!(:ingredient_supplier1) { create(:ingredient_supplier) }
    let!(:ingredient_supplier2) { create(:ingredient_supplier) }

    it "works" do
      expect(IngredientSupplierResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["ingredient_suppliers"])
      expect(d.map(&:id)).to match_array([ingredient_supplier1.id,
                                          ingredient_supplier2.id])
    end
  end
end
