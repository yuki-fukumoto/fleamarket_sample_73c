class Address < ApplicationRecord
  validates :firstname, :lastname, :firstname_read, :lastname_read, :zip, :prefecture, :city, :address_line, presence: {message: "が空欄です"}
  validates :zip, length: {is: 7, message: "は７桁で入力してくだい"}
  validates :firstname, :lastname, :firstname_read, :lastname_read, :prefecture, :city, format: { with: /\A[ぁ-んー－]+\z/, message: "は全角(ひらがな)で入力してください"}


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
