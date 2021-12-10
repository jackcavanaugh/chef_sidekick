require "rails_helper"

RSpec.describe RecipeMenuJoinResource, type: :resource do
  describe "serialization" do
    let!(:recipe_menu_join) { create(:recipe_menu_join) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(recipe_menu_join.id)
      expect(data.jsonapi_type).to eq("recipe_menu_joins")
    end
  end

  describe "filtering" do
    let!(:recipe_menu_join1) { create(:recipe_menu_join) }
    let!(:recipe_menu_join2) { create(:recipe_menu_join) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: recipe_menu_join2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([recipe_menu_join2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:recipe_menu_join1) { create(:recipe_menu_join) }
      let!(:recipe_menu_join2) { create(:recipe_menu_join) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      recipe_menu_join1.id,
                                      recipe_menu_join2.id,
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
                                      recipe_menu_join2.id,
                                      recipe_menu_join1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
