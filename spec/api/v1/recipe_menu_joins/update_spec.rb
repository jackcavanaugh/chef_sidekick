require 'rails_helper'

RSpec.describe "recipe_menu_joins#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/recipe_menu_joins/#{recipe_menu_join.id}", payload
  end

  describe 'basic update' do
    let!(:recipe_menu_join) { create(:recipe_menu_join) }

    let(:payload) do
      {
        data: {
          id: recipe_menu_join.id.to_s,
          type: 'recipe_menu_joins',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(RecipeMenuJoinResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { recipe_menu_join.reload.attributes }
    end
  end
end
