class Address < ApplicationRecord
  validates :firstname, :lastname, :firstname_read, :lastname_read, :zip, :prefecture, :city, :address_line, presence: {message: "が空欄です"}
  validates :zip, length: {is: 7, message: "は７桁で入力してくだい"}
  validates :firstname, :lastname, :prefecture, :city, format: { with: /\A[一-龥ぁ-ん]/, message: "は全角で入力してください"}
  validates :firstname_read, :lastname_read, format: { with: /\A[ぁ-んー－]+\z/, message: "は全角(ひらがな)で入力してください"}
  validates :telephone, length: {maximum: 11, message: "は11桁以下で入力してください"}
  validates :zip, :telephone, format: { with: /\A[0-9]*\z/, message: "は半角数字で入力してください"}

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
