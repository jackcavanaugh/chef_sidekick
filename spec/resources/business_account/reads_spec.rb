require "rails_helper"

RSpec.describe BusinessAccountResource, type: :resource do
  describe "serialization" do
    let!(:business_account) { create(:business_account) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(business_account.id)
      expect(data.jsonapi_type).to eq("business_accounts")
    end
  end

  describe "filtering" do
    let!(:business_account1) { create(:business_account) }
    let!(:business_account2) { create(:business_account) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: business_account2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([business_account2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:business_account1) { create(:business_account) }
      let!(:business_account2) { create(:business_account) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      business_account1.id,
                                      business_account2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      business_account2.id,
                                      business_account1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
