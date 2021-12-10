require 'rails_helper'

RSpec.describe MenuResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'menus',
          attributes: { }
        }
      }
    end

    let(:instance) do
      MenuResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Menu.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:menu) { create(:menu) }

    let(:payload) do
      {
        data: {
          id: menu.id.to_s,
          type: 'menus',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      MenuResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { menu.reload.updated_at }
      # .and change { menu.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:menu) { create(:menu) }

    let(:instance) do
      MenuResource.find(id: menu.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Menu.count }.by(-1)
    end
  end
end
