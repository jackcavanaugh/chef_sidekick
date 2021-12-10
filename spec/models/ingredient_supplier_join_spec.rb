require "rails_helper"

RSpec.describe IngredientSupplierJoin, type: :model do
  describe "Direct Associations" do
    it { should have_many(:ingredient_reviews) }

    it { should belong_to(:ingredient) }

    it { should belong_to(:supplier) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
