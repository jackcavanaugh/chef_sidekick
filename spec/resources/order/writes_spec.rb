require "rails_helper"

RSpec.describe OrderResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "orders",
          attributes: {},
        },
      }
    end

    let(:instance) do
      OrderResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { Order.count }.by(1)
    end
  end

  describe "updating" do
    let!(:order) { create(:order) }

    let(:payload) do
      {
        data: {
          id: order.id.to_s,
          type: "orders",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      OrderResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { order.reload.updated_at }
      # .and change { order.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:order) { create(:order) }

    let(:instance) do
      OrderResource.find(id: order.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { Order.count }.by(-1)
    end
  end
end
