class Address < ApplicationRecord
  validates :firstname_read, :lastname_read, :prefecture, :city, :address_line, presence: true
  validates :zip, format: { with: /\A\d{3}\-?\d{4}\z/,  message: "郵便番号は半角数字７桁で入力してくだい"} 
  validates :firstname, :lastname, format: {with:/[一-龥ぁ-ん]/, message: "漢字で入力してください"}
  validates :firstname, :lastname, :prefecture, :city, format: { with: /\A[一-龥ぁ-ん]/, message: "は全角で入力してください"}
  validates :firstname_read, :lastname_read, format: { with: /\A[ぁ-んー－]+\z/, message: "ひらがなで入力してください"}


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
