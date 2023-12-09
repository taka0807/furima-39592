class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         validates :nickname, presence: true
         validates :password,  format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: 'は半角英数字混合で入力してください' }
         validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は全角文字で入力してください' }
         validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は全角文字で入力してください' }
         validates :furigana_last_name, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'は全角カナ文字で入力してください' }
         validates :furigana_first_name, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'は全角カナ文字で入力してください' }
         validates :birthday, presence: true

         has_many :items
         has_many :purchases
end



# 正規表現
#  validates :password_confirmation, presence: true
        #  validates :password, confirmation: true # パスワードとパスワード（確認）が一致していることを確認
