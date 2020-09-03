require 'rails_helper'

RSpec.describe Address, type: :model do


  describe "全属性のバリデーション" do
    let(:address) {FactoryBot.build(:address)}
    subject{address}
    context "値がすべて入力されている場合" do
      it {is_expected.to be_valid}
    end
  end
  describe "firstnameのバリデーション" do
    let(:address) {FactoryBot.build(:address, firstname: firstname)}
    context "登録される" do
      subject{address}
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
      subject{address.errors[:firstname]}
      before do
        address.valid?
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
    let(:address) {FactoryBot.build(:address, lastname: lastname)}
    context "登録される" do
      subject{address}
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
      subject{address.errors[:lastname]}
      before do
        address.valid?
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
    let(:address) {FactoryBot.build(:address, firstname_read: firstname_read)}
    context "登録される" do
      subject{address}
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
      subject{address.errors[:firstname_read]}
      before do
        address.valid?
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
    let(:address) {FactoryBot.build(:address, lastname_read: lastname_read)}
    context "登録される" do
      subject{address}
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
      subject{address.errors[:lastname_read]}
      before do
        address.valid?
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
  describe "zipのバリデーション" do
    let(:address) {FactoryBot.build(:address, first_zip: first_zip, last_zip: last_zip)}
    context "登録される" do
      subject{address}
      context "zipが7桁で入力されている" do
        let(:first_zip) {"758"}
        let(:last_zip) {"0011"}
        it {is_expected.to be_valid}
      end
    end
    context "登録されない" do
      subject{address.errors[:zip]}
      before do
        address.valid?
      end
      context "zipがない" do
        let(:first_zip) {nil}
        let(:last_zip) {nil}
        it {is_expected.to include("が空欄です")}
      end
      context "zipが合計6文字" do
        let(:first_zip) {"758"}
        let(:last_zip) {"001"}
        it {is_expected.to include("は７桁で入力してくだい")}
      end
      context "zipが合計8文字" do
        let(:first_zip) {"758"}
        let(:last_zip) {"00111"}
        it {is_expected.to include("は７桁で入力してくだい")}
      end
    end
  end
  describe "prefectureのバリデーション" do
    let(:address) {FactoryBot.build(:address, prefecture: prefecture)}
    context "登録される" do
      subject{address}
      context "prefectureが全角で入力されている" do
        let(:prefecture) {"山口県"}
        it {is_expected.to be_valid}
      end
      context "prefectureの文字数が4文字" do
        let(:prefecture) {"神奈川県"}
        it {is_expected.to be_valid}
      end
    end
    context "登録されない" do
      subject{address.errors[:prefecture]}
      before do
        address.valid?
      end
      context "prefectureがない" do
        let(:prefecture) {nil}
        it {is_expected.to include("が空欄です")}
      end
      context "prefectureが半角" do
        let(:prefecture) {"yamaguchi-prefecture"}
        it {is_expected.to include("は全角で入力してください")}
      end
      context "prefectureが47都道府県じゃない" do
        let(:prefecture) {"淡路島"}
        it {is_expected.to include("は不正な値です")}
      end
      context "prefectureの文字数が5文字" do
        let(:prefecture) {"和歌山市駅"}
        it {is_expected.to include("は不正な値です")}
      end
    end
  end
  describe "cityのバリデーション" do
    let(:address) {FactoryBot.build(:address, city: city)}
    context "登録される" do
      subject{address}
      context "cityが全角で入力されている" do
        let(:city) {"萩市"}
        it {is_expected.to be_valid}
      end
      context "cityの文字数が30文字" do
        let(:city) {"をザソざうマひぢにベぼミぷこルヌあアせガぇずまなソテつでヌソ"}
        it {is_expected.to be_valid}
      end
    end
    context "登録されない" do
      subject{address.errors[:city]}
      before do
        address.valid?
      end
      context "cityがない" do
        let(:city) {nil}
        it {is_expected.to include("が空欄です")}
      end
      context "cityが半角" do
        let(:city) {"hagi-city"}
        it {is_expected.to include("は全角で入力してください")}
      end
      context "cityの文字数が31文字" do
        let(:city) {"をザソざうあマひぢにベぼミぷこルヌあアせガぇずまなソテつでヌソ"}
        it {is_expected.to include("システムエラー：文字数オーバー")}
      end
    end
  end
  describe "address_lineのバリデーション" do
    let(:address) {FactoryBot.build(:address, address_line: address_line)}
    context "登録される" do
      subject{address}
      context "address_lineが数字のみ入力されている" do
        let(:address_line) {"1537"}
        it {is_expected.to be_valid}
      end
      context "address_lineの文字数が30文字" do
        let(:address_line) {"123456789012345678901234567890"}
        it {is_expected.to be_valid}
      end
    end
    context "登録されない" do
      subject{address.errors[:address_line]}
      before do
        address.valid?
      end
      context "address_lineがない" do
        let(:address_line) {nil}
        it {is_expected.to include("が空欄です")}
      end
      context "address_lineが数字じゃない" do
        let(:address_line) {"アイウエオ牡蠣くけこ"}
        it {is_expected.to include("は半角数字で入力してください")}
      end
      context "address_lineの文字数が31文字" do
        let(:address_line) {"1234567890123456789012345678901"}
        it {is_expected.to include("システムエラー：文字数オーバー")}
      end
    end
  end
  describe "buildingのバリデーション" do
    let(:address) {FactoryBot.build(:address, building: building)}
    context "登録される" do
      subject{address}
      context "buildingが空欄" do
        let(:building) {nil}
        it {is_expected.to be_valid}
      end
      context "buildingの文字数が30文字" do
        let(:building) {"をザソざうマひぢにベぼミぷこルヌあアせガぇずまなソテつでヌソ"}
        it {is_expected.to be_valid}
      end
    end
    context "登録されない" do
      subject{address.errors[:building]}
      before do
        address.valid?
      end
      context "buildingの文字数が31文字" do
        let(:building) {"をザソざうあマひぢにベぼミぷこルヌあアせガぇずまなソテつでヌソ"}
        it {is_expected.to include("システムエラー：文字数オーバー")}
      end
    end
  end
  describe "roomのバリデーション" do
    let(:address) {FactoryBot.build(:address, room: room)}
    context "登録される" do
      subject{address}
      context "roomが空欄" do
        let(:room) {nil}
        it {is_expected.to be_valid}
      end
      context "roomの文字数が30文字" do
        let(:room) {"をザソざうマひぢにベぼミぷこルヌあアせガぇずまなソテつでヌソ"}
        it {is_expected.to be_valid}
      end
    end
    context "登録されない" do
      subject{address.errors[:room]}
      before do
        address.valid?
      end
      context "roomの文字数が31文字" do
        let(:room) {"をザソざうあマひぢにベぼミぷこルヌあアせガぇずまなソテつでヌソ"}
        it {is_expected.to include("システムエラー：文字数オーバー")}
      end
    end
  end
  describe "telephoneのバリデーション" do
    let(:address) {FactoryBot.build(:address, first_telephone: first_telephone, second_telephone: second_telephone, third_telephone: third_telephone)}
    context "登録される" do
      subject{address}
      context "telephoneが空欄" do
        let(:first_telephone) {nil}
        let(:second_telephone) {nil}
        let(:third_telephone) {nil}
        it {is_expected.to be_valid}
      end
      context "telephoneが11桁で入力されている" do
        let(:first_telephone) {"010"}
        let(:second_telephone) {"2345"}
        let(:third_telephone) {"6789"}
        it {is_expected.to be_valid}
      end
    end
    context "登録されない" do
      subject{address.errors[:telephone]}
      before do
        address.valid?
      end
      context "telephoneが12桁で入力されている" do
        let(:first_telephone) {"0101"}
        let(:second_telephone) {"2345"}
        let(:third_telephone) {"6789"}
        it {is_expected.to include("は11桁以下で入力してください")}
      end
    end
  end

  describe "set_zipメソッド" do
    context "正常に動作している" do
      let(:address) {FactoryBot.create(:address, first_zip: "758", last_zip: "0011")}
      subject{address[:zip]}
      it {is_expected.to eq "7580011"}
    end
  end
  describe "set_telephoneメソッド" do
    context "正常に動作している" do
      let(:address) {FactoryBot.create(:address, first_telephone: "01", second_telephone: "2345", third_telephone: "6789")}
      subject{address[:telephone]}
      it {is_expected.to eq "0123456789"}
    end
  end
end
