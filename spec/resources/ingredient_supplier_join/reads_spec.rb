require 'rails_helper'

RSpec.describe IngredientSupplierJoinResource, type: :resource do
  describe 'serialization' do
    let!(:ingredient_supplier_join) { create(:ingredient_supplier_join) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(ingredient_supplier_join.id)
      expect(data.jsonapi_type).to eq('ingredient_supplier_joins')
    end
  end

  describe 'filtering' do
    let!(:ingredient_supplier_join1) { create(:ingredient_supplier_join) }
    let!(:ingredient_supplier_join2) { create(:ingredient_supplier_join) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: ingredient_supplier_join2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([ingredient_supplier_join2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:ingredient_supplier_join1) { create(:ingredient_supplier_join) }
      let!(:ingredient_supplier_join2) { create(:ingredient_supplier_join) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            ingredient_supplier_join1.id,
            ingredient_supplier_join2.id
          ])
        end
      end

      context 'when descending' do
        before do
          params[:sort] = '-id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            ingredient_supplier_join2.id,
            ingredient_supplier_join1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
