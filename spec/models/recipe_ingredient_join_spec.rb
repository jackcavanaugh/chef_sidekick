require "rails_helper"

RSpec.describe RecipeIngredientJoin, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:ingredient) }

    it { should belong_to(:recipe) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
