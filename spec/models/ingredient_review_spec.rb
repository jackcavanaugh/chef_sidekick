require "rails_helper"

RSpec.describe IngredientReview, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:ingredient_supplier_join) }

    it { should belong_to(:ingredient_reviewers) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
