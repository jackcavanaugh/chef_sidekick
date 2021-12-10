require "rails_helper"

RSpec.describe RecipeMenuJoin, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:menu) }

    it { should belong_to(:recipe) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
