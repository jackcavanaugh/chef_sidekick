require 'rails_helper'

RSpec.describe IngredientReviewResource, type: :resource do
  describe 'serialization' do
    let!(:ingredient_review) { create(:ingredient_review) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(ingredient_review.id)
      expect(data.jsonapi_type).to eq('ingredient_reviews')
    end
  end

  describe 'filtering' do
    let!(:ingredient_review1) { create(:ingredient_review) }
    let!(:ingredient_review2) { create(:ingredient_review) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: ingredient_review2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([ingredient_review2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:ingredient_review1) { create(:ingredient_review) }
      let!(:ingredient_review2) { create(:ingredient_review) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            ingredient_review1.id,
            ingredient_review2.id
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
            ingredient_review2.id,
            ingredient_review1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
