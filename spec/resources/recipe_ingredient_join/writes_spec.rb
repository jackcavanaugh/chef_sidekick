require 'rails_helper'

RSpec.describe RecipeIngredientJoinResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'recipe_ingredient_joins',
          attributes: { }
        }
      }
    end

    let(:instance) do
      RecipeIngredientJoinResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { RecipeIngredientJoin.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:recipe_ingredient_join) { create(:recipe_ingredient_join) }

    let(:payload) do
      {
        data: {
          id: recipe_ingredient_join.id.to_s,
          type: 'recipe_ingredient_joins',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      RecipeIngredientJoinResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { recipe_ingredient_join.reload.updated_at }
      # .and change { recipe_ingredient_join.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:recipe_ingredient_join) { create(:recipe_ingredient_join) }

    let(:instance) do
      RecipeIngredientJoinResource.find(id: recipe_ingredient_join.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { RecipeIngredientJoin.count }.by(-1)
    end
  end
end
