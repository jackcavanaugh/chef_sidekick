require 'rails_helper'

RSpec.describe IngredientSupplier, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:ingredient_supplier_joins) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
