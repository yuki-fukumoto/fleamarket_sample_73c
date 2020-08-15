require 'rails_helper'

RSpec.describe Category, type: :model do
  describe "nameのバリデーション" do
    let(:category) {FactoryBot.build(:category, name: name)}
    context "登録される" do
      subject{category}
      context "nameが入力されている" do
        let(:name) {"書籍"}
        it {is_expected.to be_valid}
      end
    end
    context "登録されない" do
      subject{category.errors[:name]}
      before do
        category.valid?
      end
      context "nameがない" do
        let(:name) {nil}
        it {is_expected.to include("システムエラー")}
      end
    end
  end

  describe "ancestryのバリデーション" do
    let(:category) {FactoryBot.build(:category, ancestry: ancestry)}
    context "登録される" do
      subject{category}
      context "ancestryが入力されていない" do
        let(:ancestry) {nil}
        it {is_expected.to be_valid}

      end
    end
  end
end
