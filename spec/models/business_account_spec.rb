require "rails_helper"

RSpec.describe BusinessAccount, type: :model do
  describe "Direct Associations" do
    it { should have_many(:menus) }

    it { should have_many(:ingredient_reviews) }

    it { should have_many(:supplier_reviews) }

    it { should have_many(:recipes) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
