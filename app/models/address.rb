class Address < ApplicationRecord


  validates :firstname_read, :lastname_read, :prefecture, :city, presence: true
  validates :zip, format: { with: /\A\d{3}\-?\d{4}\z/,  message: "郵便番号は半角数字７桁で入力してくだい"} 
  validates :firstname, :lastname, format: {with:/[一-龥ぁ-ん]/, message: "名前を入力してください"}
  validates :firstname, :lastname, :city, format: { with: /\A[一-龥ぁ-ん]/, message: "は全角で入力してください"}
  validates :firstname_read, :lastname_read, format: { with:/[ぁ-ん]/, message: "ひらがなで入力してください"}
  validates :prefecture, format: { with: /[一-龥]/,  message: "を入力して下さい"} 
  validates :prefecture, format: { with: /(北海道|^青森|^岩手|^宮城|^秋田|^山形|^福島|^茨城|^栃木|^群馬|^埼玉|^千葉|^東京|^神奈川|^新潟|^富山|^石川|^福井|^山梨|^長野|^岐阜|^静岡|^愛知|^三重|^滋賀|^京都|^大阪|^兵庫|^奈良|^和歌山|^鳥取|^島根|^岡山|^広島|^山口|^徳島|^香川|^愛媛|^高知|^福岡|^佐賀|^長崎|^熊本|^大分|^宮崎|^鹿児島|^沖縄)/}
  validates :prefecture, length: { maximum:4}
  validates :address_line, format: { with: /[0-9]/,  message: "半角数字で入力してください"}

  # extend ActiveHash::Associations::ActiveRecordExtensions
  # belongs_to_active_hash :prefecture
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
