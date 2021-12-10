require "rails_helper"

RSpec.describe "orders#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/orders/#{order.id}", payload
  end

  describe "basic update" do
    let!(:order) { create(:order) }

    let(:payload) do
      {
        data: {
          id: order.id.to_s,
          type: "orders",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(OrderResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { order.reload.attributes }
    end
  end
end
