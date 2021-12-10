require "rails_helper"

RSpec.describe "orders#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/orders/#{order.id}"
  end

  describe "basic destroy" do
    let!(:order) { create(:order) }

    it "updates the resource" do
      expect(OrderResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { Order.count }.by(-1)
      expect { order.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
