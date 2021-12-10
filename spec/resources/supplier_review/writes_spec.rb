require "rails_helper"

RSpec.describe SupplierReviewResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "supplier_reviews",
          attributes: {},
        },
      }
    end

    let(:instance) do
      SupplierReviewResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { SupplierReview.count }.by(1)
    end
  end

  describe "updating" do
    let!(:supplier_review) { create(:supplier_review) }

    let(:payload) do
      {
        data: {
          id: supplier_review.id.to_s,
          type: "supplier_reviews",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      SupplierReviewResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { supplier_review.reload.updated_at }
      # .and change { supplier_review.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:supplier_review) { create(:supplier_review) }

    let(:instance) do
      SupplierReviewResource.find(id: supplier_review.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { SupplierReview.count }.by(-1)
    end
  end
end
