class Address < ApplicationRecord
  validates :firstname, :lastname, :firstname_read, :lastname_read, :zip, :prefecture, :city, :address_line, presence: true
  validates :zip, length: {is: 7}
  validates :firstname_read, :lastname_read, format: { with: /\p{Hiragana}/, message: "は全角で入力してください"}

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
