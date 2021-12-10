require "rails_helper"

RSpec.describe IngredientSupplierJoinResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "ingredient_supplier_joins",
          attributes: {},
        },
      }
    end

    let(:instance) do
      IngredientSupplierJoinResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { IngredientSupplierJoin.count }.by(1)
    end
  end

  describe "updating" do
    let!(:ingredient_supplier_join) { create(:ingredient_supplier_join) }

    let(:payload) do
      {
        data: {
          id: ingredient_supplier_join.id.to_s,
          type: "ingredient_supplier_joins",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      IngredientSupplierJoinResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { ingredient_supplier_join.reload.updated_at }
      # .and change { ingredient_supplier_join.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:ingredient_supplier_join) { create(:ingredient_supplier_join) }

    let(:instance) do
      IngredientSupplierJoinResource.find(id: ingredient_supplier_join.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { IngredientSupplierJoin.count }.by(-1)
    end
  end
end
