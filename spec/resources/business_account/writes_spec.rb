require 'rails_helper'

RSpec.describe BusinessAccountResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'business_accounts',
          attributes: { }
        }
      }
    end

    let(:instance) do
      BusinessAccountResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { BusinessAccount.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:business_account) { create(:business_account) }

    let(:payload) do
      {
        data: {
          id: business_account.id.to_s,
          type: 'business_accounts',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      BusinessAccountResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { business_account.reload.updated_at }
      # .and change { business_account.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:business_account) { create(:business_account) }

    let(:instance) do
      BusinessAccountResource.find(id: business_account.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { BusinessAccount.count }.by(-1)
    end
  end
end
