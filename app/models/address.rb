class Address < ApplicationRecord
  validates :firstname, :lastname, :firstname_read, :lastname_read, :zip, :prefecture, :city, :address_line, presence: {message: "が空欄です"}
  validates :zip, length: {is: 7, message: "は７桁で入力してくだい"}
  validates :firstname, :lastname, :prefecture, :city, format: { with: /\A[一-龥ぁ-ん]/, message: "は全角で入力してください"}
  validates :firstname_read, :lastname_read, format: { with: /\A[ぁ-んー－]+\z/, message: "は全角(ひらがな)で入力してください"}
  validates :telephone, length: {maximum: 11, message: "は11桁以下で入力してください"}
  validates :zip, :telephone, format: { with: /\A[0-9]*\z/, message: "は半角数字で入力してください"}
  validates :prefecture, format: { with: /(北海道|青森|岩手|宮城|秋田|山形|福島|茨城|栃木|群馬|埼玉|千葉|東京|神奈川|新潟|富山|石川|福井|山梨|長野|岐阜|静岡|愛知|三重|滋賀|京都|大阪|兵庫|奈良|和歌山|鳥取|島根|岡山|広島|山口|徳島|香川|愛媛|高知|福岡|佐賀|長崎|熊本|大分|宮崎|鹿児島|沖縄)/}
  validates :prefecture, length: {maximum: 4, message: "は不正な値です"}
  validates :address_line, format: { with: /[0-9]/,  message: "は半角数字で入力してください"}
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
