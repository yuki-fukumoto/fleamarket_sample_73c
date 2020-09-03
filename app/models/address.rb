class Address < ApplicationRecord
  validates :firstname, :lastname, :firstname_read, :lastname_read, :zip, :prefecture, :city, presence: {message: "が空欄です"}
  validates :zip, length: {is: 7, message: "は７桁で入力してくだい"}
  validates :firstname, :lastname, :prefecture, :city, format: { with: /\A[一-龥ぁ-ん]/, message: "は全角で入力してください"}
  validates :firstname_read, :lastname_read, format: { with: /\A[ぁ-んー－]+\z/, message: "は全角(ひらがな)で入力してください"}
  validates :telephone, length: {maximum: 11, message: "は11桁以下で入力してください"}
  validates :zip, :telephone, format: { with: /\A[0-9]*\z/, message: "は半角数字で入力してください"}
  validates :prefecture, format: { with: /\A(北海道|青森|岩手|宮城|秋田|山形|福島|茨城|栃木|群馬|埼玉|千葉|東京|神奈川|新潟|富山|石川|福井|山梨|長野|岐阜|静岡|愛知|三重|滋賀|京都|大阪|兵庫|奈良|和歌山|鳥取|島根|岡山|広島|山口|徳島|香川|愛媛|高知|福岡|佐賀|長崎|熊本|大分|宮崎|鹿児島|沖縄|青森県|岩手県|宮城県|秋田県|山形県|福島県|茨城県|栃木県|群馬県|埼玉県|千葉県|東京都|神奈川県|新潟県|富山県|石川県|福井県|山梨県|長野県|岐阜県|静岡県|愛知県|三重県|滋賀県|京都府|大阪府|兵庫県|奈良県|和歌山県|鳥取県|島根県|岡山県|広島県|山口県|徳島県|香川県|愛媛県|高知県|福岡県|佐賀県|長崎県|熊本県|大分県|宮崎県|鹿児島県|沖縄県)*\z/}
  validates :prefecture, length: {maximum: 4, message: "は不正な値です"}
  validates :address_line, presence: { message: "を入力してください"}
  # フォームに文字数制限をかけているため、30文字以上入力された場合は不正アクセスまたはシステムエラー
  validates :firstname, :lastname, :firstname_read, :lastname_read, :prefecture, :city, :address_line, :building, :room, length: {maximum: 30, message: "システムエラー：文字数オーバー"}

  attr_accessor :first_zip, :last_zip, :first_telephone, :second_telephone, :third_telephone
  before_validation :set_zip
  before_validation :set_telephone

  belongs_to :user
  has_many :purchases

  def set_zip
    self.zip = [@first_zip, @last_zip].join
  end

  def set_telephone
    self.telephone = [@first_telephone, @second_telephone, @third_telephone].join
  end

end
