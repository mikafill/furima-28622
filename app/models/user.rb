class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: {message: "必須項目です"} do
    validates :nickname
    validates :email, uniqueness: {message: "すでに使用されているアドレスです"}, format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: "有効なメールアドレスを入力してください"}
    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
    validates :password, length: {minimum: 6, message: "6文字以上で入力してください"}, format: {with: PASSWORD_REGEX, message: "半角英数字で入力してください"}, confirmation: true
    validates :birthday
  end

  with_options presence: {message: "必須項目です"}, format: {with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "全角で入力してください"}  do
    validates :first_name
    validates :last_name
  end

  with_options presence: {message: "必須項目です"}, format: {with: /\A[ァ-ン]+\z/, message: "カタカナで入力してください"} do
    validates :kana_first_name
    validates :kana_last_name
  end

end
