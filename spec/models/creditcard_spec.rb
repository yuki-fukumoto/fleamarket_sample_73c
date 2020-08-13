require 'rails_helper'

RSpec.describe Creditcard, type: :model do
  describe "customer_idのバリデーション" do
    let(:creditcard) {FactoryBot.build(:creditcard, customer_id: customer_id)}
    context "登録される" do
      subject{creditcard}
      context "customer_idがある" do
        let(:customer_id) {"cus_xxx"}
        it {is_expected.to be_valid}
      end
    end
    context "登録されない" do
      subject{creditcard.errors[:customer_id]}
      before do
        creditcard.valid?
      end
      context "customer_idがない" do
        let(:customer_id) {nil}
        it {is_expected.to include("：システムエラー")}
      end
    end
  end
  describe "card_idのバリデーション" do
    let(:creditcard) {FactoryBot.build(:creditcard, card_id: card_id)}
    context "登録される" do
      subject{creditcard}
      context "card_idがある" do
        let(:card_id) {"car_xxx"}
        it {is_expected.to be_valid}
      end

    end
    context "登録されない" do
      subject{creditcard.errors[:card_id]}
      before do
        creditcard.valid?
      end
      context "card_idがない" do
        let(:card_id) {nil}
        it {is_expected.to include("：システムエラー")}
      end

    end
  end


  describe "create_card" do
    context "creditcardレコードが生成される" do
      before do
        payjp_customer = double("Payjp::Customer")
        allow(Payjp::Customer).to receive(:create).and_return(payjp_customer)
        allow(payjp_customer).to receive(:id).and_return("cus_xxx")
        allow(payjp_customer).to receive(:default_card).and_return("car_xxx")

      end
      let(:user) {FactoryBot.create(:user)}
      subject{->{ Creditcard.create_card({token: "tok_xxx", user_id: user.id}) }}
      it {is_expected.to change(Creditcard, :count).by(1)}
    end
  end
  describe "get_card_data" do
    # 省略：全行、API通信から成り立つメソッドであるため。
    # API通信用のモックを作成することでテスト実施可能だが、「モックのテストを実施することになり」意味がない。
  end
end
