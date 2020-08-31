require 'rails_helper'

RSpec.describe User, type: :model do
  describe "全属性のバリデーション" do
    let(:user) {FactoryBot.build(:user)}
    subject{user}

    context "name, place, email, passwordがある場合" do
      it {is_expected.to be_valid}
    end
  end
  describe "nicknameのバリデーション" do
    let(:user) {FactoryBot.build(:user, nickname: nickname)}
    context "登録される" do
      subject{user}
      context "nicknameが入力されている" do
        let(:nickname) {"Shinsaku Takasugi"}
        it {is_expected.to be_valid}
      end
      context "nicknameの文字数が30文字" do
        let(:nickname) {"g9pAOlabCkPZ8oWCZHClRwJrBNxLyi"}
        it {is_expected.to be_valid}
      end
    end
    context "登録されない" do
      subject{user.errors[:nickname]}
      before do
        user.valid?
      end
      context "nicknameがない" do
        let(:nickname) {nil}
        it {is_expected.to include("が空欄です")}
      end
      context "nicknameの文字数が31文字" do
        let(:nickname) {"g9pAOlabCkPZ8oWCZHClRwJrBNxLyia"}
        it {is_expected.to include("システムエラー：文字数オーバー")}
      end
    end
  end
  describe "firstnameのバリデーション" do
    let(:user) {FactoryBot.build(:user, firstname: firstname)}
    context "登録される" do
      subject{user}
      context "firstnameが全角で入力されている" do
        let(:firstname) {"晋作"}
        it {is_expected.to be_valid}
      end
      context "firstnameの文字数が30文字" do
        let(:firstname) {"をザソざうマひぢにベぼミぷこルヌあアせガぇずまなソテつでヌソ"}
        it {is_expected.to be_valid}
      end
    end
    context "登録されない" do
      subject{user.errors[:firstname]}
      before do
        user.valid?
      end
      context "firstnameがない" do
        let(:firstname) {nil}
        it {is_expected.to include("が空欄です")}
      end
      context "firstnameが半角" do
        let(:firstname) {"shinsaku"}
        it {is_expected.to include("は全角で入力してください")}
      end
      context "firstnameの文字数が31文字" do
        let(:firstname) {"をザソざうあマひぢにベぼミぷこルヌあアせガぇずまなソテつでヌソ"}
        it {is_expected.to include("システムエラー：文字数オーバー")}
      end
    end
  end
  describe "lastnameのバリデーション" do
    let(:user) {FactoryBot.build(:user, lastname: lastname)}
    context "登録される" do
      subject{user}
      context "lastnameが全角で入力されている" do
        let(:lastname) {"高杉"}
        it {is_expected.to be_valid}
      end
      context "lastnameの文字数が30文字" do
        let(:lastname) {"をザソざうマひぢにベぼミぷこルヌあアせガぇずまなソテつでヌソ"}
        it {is_expected.to be_valid}
      end
    end
    context "登録されない" do
      subject{user.errors[:lastname]}
      before do
        user.valid?
      end
      context "lastnameがない" do
        let(:lastname) {nil}
        it {is_expected.to include("が空欄です")}
      end
      context "lastnameが半角" do
        let(:lastname) {"takasugi"}
        it {is_expected.to include("は全角で入力してください")}
      end
      context "lastnameの文字数が31文字" do
        let(:lastname) {"をザソざうあマひぢにベぼミぷこルヌあアせガぇずまなソテつでヌソ"}
        it {is_expected.to include("システムエラー：文字数オーバー")}
      end
    end
  end
  describe "firstname_readのバリデーション" do
    let(:user) {FactoryBot.build(:user, firstname_read: firstname_read)}
    context "登録される" do
      subject{user}
      context "firstname_readが全角で入力されている" do
        let(:firstname_read) {"しんさく"}
        it {is_expected.to be_valid}
      end
      context "firstname_readの文字数が30文字" do
        let(:firstname_read) {"あいうえおかきくけこさしすてそたちつてとなになぬねのはひふへ"}
        it {is_expected.to be_valid}
      end
    end
    context "登録されない" do
      subject{user.errors[:firstname_read]}
      before do
        user.valid?
      end
      context "firstname_readがない" do
        let(:firstname_read) {nil}
        it {is_expected.to include("が空欄です")}
      end
      context "firstname_readが半角" do
        let(:firstname_read) {"shinsaku"}
        it {is_expected.to include("は全角(ひらがな)で入力してください")}
      end
      context "firstname_readが漢字" do
        let(:firstname_read) {"晋作"}
        it {is_expected.to include("は全角(ひらがな)で入力してください")}
      end
      context "firstname_readの文字数が31文字" do
        let(:firstname_read) {"あいうえおかきくけこさしすてそたちつてとなになぬねのはひふへあ"}
        it {is_expected.to include("システムエラー：文字数オーバー")}
      end
    end
  end

  describe "lastname_readのバリデーション" do
    let(:user) {FactoryBot.build(:user, lastname_read: lastname_read)}
    context "登録される" do
      subject{user}
      context "lastname_readが全角で入力されている" do
        let(:lastname_read) {"たかすぎ"}
        it {is_expected.to be_valid}
      end
      context "lastname_readの文字数が30文字" do
        let(:lastname_read) {"あいうえおかきくけこさしすてそたちつてとなになぬねのはひふへ"}
        it {is_expected.to be_valid}
      end
    end
    context "登録されない" do
      subject{user.errors[:lastname_read]}
      before do
        user.valid?
      end
      context "lastname_readがない" do
        let(:lastname_read) {nil}
        it {is_expected.to include("が空欄です")}
      end
      context "lastname_readが半角" do
        let(:lastname_read) {"takasugi"}
        it {is_expected.to include("は全角(ひらがな)で入力してください")}
      end
      context "lastname_readが漢字" do
        let(:lastname_read) {"高杉"}
        it {is_expected.to include("は全角(ひらがな)で入力してください")}
      end
      context "lastname_readの文字数が31文字" do
        let(:lastname_read) {"あいうえおかきくけこさしすてそたちつてとなになぬねのはひふへあ"}
        it {is_expected.to include("システムエラー：文字数オーバー")}
      end
    end
  end
  describe "birthdayのバリデーション" do
    let(:user) {FactoryBot.build(:user, birthday: birthday)}
    context "登録される" do
      subject{user}
      context "birthdayが入力されている" do
        let(:birthday) {2020-9-27}
        it {is_expected.to be_valid}
      end
    end
    context "登録されない" do
      subject{user.errors[:birthday]}
      before do
        user.valid?
      end
      context "birthdayがない" do
        let(:birthday) {nil}
        it {is_expected.to include("が空欄です")}
      end
    end
  end
  describe "emailのバリデーション" do
    let(:user) {FactoryBot.build(:user, email: email)}
    context "登録される" do
      subject{user}
      context "emailが入力されている" do
        let(:email) {"omosirokikoto@school.com"}
        it {is_expected.to be_valid}
      end
      context "emailの文字数が256文字" do
        let(:email) {"5AyHVD9QFsyFhh4haT5rXMj1kovY2AMCBrxlxoGulp9Fu9Ocurrrr0GY3yo53Dn6P8fy1WqpdbLKwcjNkIXqv6wNjNNzCcH@XBocDEpYpUjVp5k8gFFyyAEf68RACZsKa05lD95e1N4agyfBOS7VfSWOl3XztJ5Wwk4SdJWFEbjBBcCeUi6xIjfHWBmjscFaCSFZiF1URkLBS53mRSn5NrUqSTCeuaBKr7SiHANhW1RPxoFnWpePRqCODhYLHtGX"}
        it {is_expected.to be_valid}
      end
    end
    context "登録されない" do
      subject{user.errors[:email]}
      before do
        user.valid?
      end
      context "emailがない" do
        let(:email) {nil}
        it {is_expected.to include("を入力してください")}
      end
      context "すでに登録されているemialの場合" do
        let(:email) {"shokason@school.com"}
        before do
          FactoryBot.create(:user, email: "shokason@school.com")
          user.valid?
        end
        it {is_expected.to include("はすでに存在します")}
      end
      context "@が含まれていない" do
        let(:email) {"sokason.school.com"}
        it {is_expected.to include("は不正な値です")}
      end
      context "ドメインがない" do
        let(:email) {"sokason@"}
        it {is_expected.to include("は不正な値です")}
      end
      context "emailの文字数が257文字" do
        let(:email) {"5AyHVDa9QFsyFhh4haT5rXMj1kovY2AMCBrxlxoGulp9Fu9Ocurrrr0GY3yo53Dn6P8fy1WqpdbLKwcjNkIXqv6wNjNNzCcH@XBocDEpYpUjVp5k8gFFyyAEf68RACZsKa05lD95e1N4agyfBOS7VfSWOl3XztJ5Wwk4SdJWFEbjBBcCeUi6xIjfHWBmjscFaCSFZiF1URkLBS53mRSn5NrUqSTCeuaBKr7SiHANhW1RPxoFnWpePRqCODhYLHtGX"}
        it {is_expected.to include("システムエラー：文字数オーバー")}
      end
      context "全角文字を含む" do
        let(:email) {"abc@あいう"}
        it {is_expected.to include("は半角英数で入力してください")}
      end
    end
  end
  describe "passwordのバリデーション" do
    let(:user) {FactoryBot.build(:user, password: password, password_confirmation: password_confirmation)}
    context "登録される" do
      subject{user}
      context "passwordが入力されている" do
        let(:password) {"1234567"}
        let(:password_confirmation) {"1234567"}
        it {is_expected.to be_valid}
      end
      context "passwordが7文字" do
        let(:password) {"1234567"}
        let(:password_confirmation) {"1234567"}
        it {is_expected.to be_valid}
      end
      context "passwordが30文字" do
        let(:password) {"zjSiAsgotSqdXR6lDsLG91bmi5M5rO"}
        let(:password_confirmation) {"zjSiAsgotSqdXR6lDsLG91bmi5M5rO"}
        it {is_expected.to be_valid}
      end
    end
    context "登録されない" do
      subject{user.errors[:password]}
      before do
        user.valid?
      end
      context "passwordがない" do
        let(:password) {nil}
        let(:password_confirmation) {nil}
        it {is_expected.to include("が空欄です")}
      end
      context "passwordが6文字" do
        let(:password) {"123456"}
        let(:password_confirmation) {"123456"}
        it {is_expected.to include("は7文字以上で入力してください")}
      end
      context "passwordが31文字" do
        let(:password) {"zjSiAsgotSqdXR6lDsLG91bmi5M5rOa"}
        let(:password_confirmation) {"zjSiAsgotSqdXR6lDsLG91bmi5M5rOa"}
        it {is_expected.to include("システムエラー：文字数オーバー")}
      end
      context "passwordが存在してもpassword_confirmationが一致しない場合" do
        subject {user.errors[:password_confirmation]}
        let(:password) {"1234567"}
        let(:password_confirmation) {"7654321"}
        it {is_expected.to include("とパスワードの入力が一致しません")}
      end
    end
  end
end
