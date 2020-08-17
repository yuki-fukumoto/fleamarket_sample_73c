class User < ApplicationRecord
  validates :nickname, :firstname_read, :lastname_read, :birthday, :password, presence: true
  validates :firstname, :lastname, format: {with:/[一-龥ぁ-ん]/, message: "漢字で入力してください"}
  validates :firstname_read, :lastname_read, format: { with: /\A[ぁ-んー－]+\z/, message: "ひらがなで入力してください"}
  validates :password, length: { minimum:7, message: "は7文字以上で入力してください"}, confirmation: {message: "の値が一致しません"}
  validates :email, presence: {message:"が空欄です"}

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :addresses, dependent: :destroy
  accepts_nested_attributes_for :addresses
  has_many :creditcards, dependent: :destroy
  has_many :items, dependent: :destroy
  has_many :purchases, dependent: :destroy



end
