class User < ApplicationRecord
  validates :nickname, :firstname, :lastname, :firstname_read, :lastname_read, :birthday, presence: {message: "が空欄です"}
  validates :firstname_read, :lastname_read, format: { with: /\p{Hiragana}/, message: "は全角で入力してください"}

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
