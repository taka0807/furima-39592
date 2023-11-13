class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         validates :nickname, presence: true
         validates :password, presence: true, length: { minimum: 6 }, format: { with: /\A(?=.*?[a-z])(?=.*?[0-9]).{6,}\z/i, message: 'は半角英数字混合で入力してください' }
         validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龠々]+\z/, message: 'は全角文字で入力してください' }
         validates :password_confirmation, presence: true
         validates :password, confirmation: true # パスワードとパスワード（確認）が一致していることを確認
         validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龠々]+\z/, message: 'は全角文字で入力してください' }
         validates :furigana_last_name, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'は全角カナ文字で入力してください' }
         validates :furigana_first_name, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'は全角カナ文字で入力してください' }
         validates :birthday, presence: true
end


# 正規表現
