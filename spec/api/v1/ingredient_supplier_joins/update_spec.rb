require "rails_helper"

RSpec.describe "ingredient_supplier_joins#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/ingredient_supplier_joins/#{ingredient_supplier_join.id}",
                payload
  end

  describe "basic update" do
    let!(:ingredient_supplier_join) { create(:ingredient_supplier_join) }

    let(:payload) do
      {
        data: {
          id: ingredient_supplier_join.id.to_s,
          type: "ingredient_supplier_joins",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(IngredientSupplierJoinResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { ingredient_supplier_join.reload.attributes }
    end
  end
end
