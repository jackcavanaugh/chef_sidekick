require 'rails_helper'

RSpec.describe Menu, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:menu_creators) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
