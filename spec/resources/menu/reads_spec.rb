require "rails_helper"

RSpec.describe MenuResource, type: :resource do
  describe "serialization" do
    let!(:menu) { create(:menu) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(menu.id)
      expect(data.jsonapi_type).to eq("menus")
    end
  end

  describe "filtering" do
    let!(:menu1) { create(:menu) }
    let!(:menu2) { create(:menu) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: menu2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([menu2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:menu1) { create(:menu) }
      let!(:menu2) { create(:menu) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      menu1.id,
                                      menu2.id,
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
                                      menu2.id,
                                      menu1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
