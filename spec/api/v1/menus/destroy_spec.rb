require "rails_helper"

RSpec.describe "menus#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/menus/#{menu.id}"
  end

  describe "basic destroy" do
    let!(:menu) { create(:menu) }

    it "updates the resource" do
      expect(MenuResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { Menu.count }.by(-1)
      expect { menu.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
