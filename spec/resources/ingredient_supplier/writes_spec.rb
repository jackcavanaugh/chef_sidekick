require 'rails_helper'

RSpec.describe IngredientSupplierResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'ingredient_suppliers',
          attributes: { }
        }
      }
    end

    let(:instance) do
      IngredientSupplierResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { IngredientSupplier.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:ingredient_supplier) { create(:ingredient_supplier) }

    let(:payload) do
      {
        data: {
          id: ingredient_supplier.id.to_s,
          type: 'ingredient_suppliers',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      IngredientSupplierResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { ingredient_supplier.reload.updated_at }
      # .and change { ingredient_supplier.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:ingredient_supplier) { create(:ingredient_supplier) }

    let(:instance) do
      IngredientSupplierResource.find(id: ingredient_supplier.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { IngredientSupplier.count }.by(-1)
    end
  end
end
