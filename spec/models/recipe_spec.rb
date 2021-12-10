require 'rails_helper'

RSpec.describe Recipe, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:orders) }

    it { should have_many(:recipe_menu_joins) }

    it { should have_many(:recipe_ingredient_joins) }

    it { should belong_to(:chef) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
