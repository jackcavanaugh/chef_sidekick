require 'rails_helper'

RSpec.describe SupplierReview, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:chef_reviewer) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
