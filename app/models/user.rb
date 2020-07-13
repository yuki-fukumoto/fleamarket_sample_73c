class User < ApplicationRecord
  validates :nickname, :firstname, :lastname, :firstname_read, :lastname_read, :birthday, :password, presence: {message: "が空欄です"}
  validates :firstname, :lastname, :firstname_read, :lastname_read, format: { with: /\A[一-龥ぁ-ん]/, message: "は全角で入力してください"}
  validates :password, length: { minimum:7, message: "は7文字以上で入力してください"}, confirmation: {message: "の値が一致しません"}

  # address validation
  validates :firstname, :lastname, :firstname_read, :lastname_read, :zip, :prefecture, :city, :address_line, presence: {message: "が空欄です"}
  validates :zip, length: {is: 7}
  validates :firstname, :lastname, :firstname_read, :lastname_read, :prefecture, :city, format: { with: /\A[一-龥ぁ-ん]/, message: "は全角で入力してください"}
  


  attr_accessor :first_zip, :last_zip, :first_telephone, :second_telephone, :third_telephone
  before_validation :set_zip
  before_validation :set_telephone

  # belongs_to :user
  # has_many :purchases

  def set_zip
    self.zip = [@first_zip, @last_zip].join
  end
  
  def set_telephone
    self.telephone = [@first_telephone, @second_telephone, @third_telephone].join
  end




  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

  has_many :addresses, dependent: :destroy
  accepts_nested_attributes_for :addresses

  has_many :creditcards, dependent: :destroy
  has_many :items, dependent: :destroy
  has_many :purchases, dependent: :destroy

end
