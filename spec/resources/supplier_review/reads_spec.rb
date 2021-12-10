require "rails_helper"

RSpec.describe SupplierReviewResource, type: :resource do
  describe "serialization" do
    let!(:supplier_review) { create(:supplier_review) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(supplier_review.id)
      expect(data.jsonapi_type).to eq("supplier_reviews")
    end
  end

  describe "filtering" do
    let!(:supplier_review1) { create(:supplier_review) }
    let!(:supplier_review2) { create(:supplier_review) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: supplier_review2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([supplier_review2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:supplier_review1) { create(:supplier_review) }
      let!(:supplier_review2) { create(:supplier_review) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      supplier_review1.id,
                                      supplier_review2.id,
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
                                      supplier_review2.id,
                                      supplier_review1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
