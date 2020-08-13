require 'rails_helper'

RSpec.describe Purchase, type: :model do
  describe "create_charge" do
    context "purchaseレコードが生成される" do
      before do
        payjp_charge = double("Payjp::Charge")
        allow(Payjp::Charge).to receive(:create).and_return(payjp_charge)
        allow(payjp_charge).to receive(:id).and_return("cha_xxx")
      end
      let(:item) {FactoryBot.create(:item)}
      let(:address) {FactoryBot.create(:address)}
      let(:creditcard) {FactoryBot.create(:creditcard)}
      subject{->{ Purchase.create_charge({creditcard_id: creditcard.id, user_id: creditcard.user.id, item_id: item.id, address_id: address.id}, item) }}
      it {is_expected.to change(Purchase, :count).by(1)}
    end
  end
end
