require 'rails_helper'

RSpec.describe IngredientReviewResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'ingredient_reviews',
          attributes: { }
        }
      }
    end

    let(:instance) do
      IngredientReviewResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { IngredientReview.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:ingredient_review) { create(:ingredient_review) }

    let(:payload) do
      {
        data: {
          id: ingredient_review.id.to_s,
          type: 'ingredient_reviews',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      IngredientReviewResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { ingredient_review.reload.updated_at }
      # .and change { ingredient_review.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:ingredient_review) { create(:ingredient_review) }

    let(:instance) do
      IngredientReviewResource.find(id: ingredient_review.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { IngredientReview.count }.by(-1)
    end
  end
end
