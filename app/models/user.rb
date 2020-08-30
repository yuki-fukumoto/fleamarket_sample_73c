class User < ApplicationRecord
  validates :nickname, :firstname, :lastname, :firstname_read, :lastname_read, :birthday, :password, presence: {message: "が空欄です"}
  validates :firstname, :lastname, format: { with: /\A[一-龥ぁ-ん]/, message: "は全角で入力してください"}
  validates :firstname_read, :lastname_read, format: { with: /\A[ぁ-んー－]+\z/, message: "は全角(ひらがな)で入力してください"}

  validates :password, length: { minimum:7, message: "は7文字以上で入力してください"}
  validates :email, presence: {message: "が空欄です"}
  # フォームに文字数制限をかけているため、30文字以上入力された場合は不正アクセスまたはシステムエラー
  validates :firstname, :lastname, :firstname_read, :lastname_read, :nickname, :password, length: {maximum: 30, message: "システムエラー：文字数オーバー"}
  validates :email, length: {maximum: 256, message: "システムエラー：文字数オーバー"}

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  with_options presence: true do
  validates :nickname, :firstname_read, :lastname_read, :birthday, :password
  validates :firstname, :lastname, format: {with:/[一-龥ぁ-ん]/, message: "名前を入力してください"}
  validates :firstname_read, :lastname_read, format: { with:/[ぁ-ん]/, message: "ひらがなで入力してください"}
  validates :password, length: { minimum:7, message: "は7文字以上で入力してください"}, confirmation: {message: "の値が一致しません"}
end
  validates :email, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: "メールアドレスが空欄です"}

  has_one :address, dependent: :destroy
  accepts_nested_attributes_for :address
  has_one :creditcard, dependent: :destroy
  has_many :items, dependent: :destroy
  has_many :purchases, dependent: :destroy
  has_many :comments
  has_many :browsing_histories, dependent: :destroy

  has_many :favorites, dependent: :destroy
  has_many :favorites, through: :favorites, source: :item

end
