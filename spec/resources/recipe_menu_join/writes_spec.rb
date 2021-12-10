require 'rails_helper'

RSpec.describe RecipeMenuJoinResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'recipe_menu_joins',
          attributes: { }
        }
      }
    end

    let(:instance) do
      RecipeMenuJoinResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { RecipeMenuJoin.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:recipe_menu_join) { create(:recipe_menu_join) }

    let(:payload) do
      {
        data: {
          id: recipe_menu_join.id.to_s,
          type: 'recipe_menu_joins',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      RecipeMenuJoinResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { recipe_menu_join.reload.updated_at }
      # .and change { recipe_menu_join.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:recipe_menu_join) { create(:recipe_menu_join) }

    let(:instance) do
      RecipeMenuJoinResource.find(id: recipe_menu_join.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { RecipeMenuJoin.count }.by(-1)
    end
  end
end
