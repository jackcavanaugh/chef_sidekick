require 'rails_helper'

RSpec.describe BusinessAccount, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:recipes) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
