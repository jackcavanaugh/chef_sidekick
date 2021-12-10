require "rails_helper"

RSpec.describe IngredientSupplierResource, type: :resource do
  describe "serialization" do
    let!(:ingredient_supplier) { create(:ingredient_supplier) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(ingredient_supplier.id)
      expect(data.jsonapi_type).to eq("ingredient_suppliers")
    end
  end

  describe "filtering" do
    let!(:ingredient_supplier1) { create(:ingredient_supplier) }
    let!(:ingredient_supplier2) { create(:ingredient_supplier) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: ingredient_supplier2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([ingredient_supplier2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:ingredient_supplier1) { create(:ingredient_supplier) }
      let!(:ingredient_supplier2) { create(:ingredient_supplier) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      ingredient_supplier1.id,
                                      ingredient_supplier2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      ingredient_supplier2.id,
                                      ingredient_supplier1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
