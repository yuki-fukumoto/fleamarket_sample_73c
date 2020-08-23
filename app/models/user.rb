class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
 

  with_options presence: true do
  validates :nickname, :firstname_read, :lastname_read, :birthday, :password
  validates :firstname, :lastname, format: {with:/[一-龥ぁ-ん]/, message: "名前を入力してください"}
  validates :firstname_read, :lastname_read, format: { with:/[ぁ-ん]/, message: "ひらがなで入力してください"}
  validates :password, length: { minimum:7, message: "は7文字以上で入力してください"}, confirmation: {message: "の値が一致しません"}
  # validates :email, format: {with: /\A[a-z\d-]+@[a-z\d-]+(\.[a-z\d-]+)+\z/, message: "メールアドレスが空欄です"}
end
  validates :email, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: "メールアドレスが空欄です"}

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  

  has_one :address, dependent: :destroy
  accepts_nested_attributes_for :address
  has_one :creditcard, dependent: :destroy
  has_many :items, dependent: :destroy
  has_many :purchases, dependent: :destroy
end
