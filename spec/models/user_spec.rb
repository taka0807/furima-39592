require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  context  'ユーザ登録ができる時' do
    it '正常にユーザーが登録できること' do
      expect(@user).to be_valid
    end
    it '正しい形式のメールアドレスで登録できること' do
      @user.email = 'validemail@example.com'
      expect(@user).to be_valid
    end
    it '要件を満たしたパスワードで登録できること' do
      @user.password = 'ValidPassword123'
      @user.password_confirmation = 'ValidPassword123'
      expect(@user).to be_valid
    end
    it '適切な形式の名前で登録できること' do
      @user.last_name = '山田'
      @user.first_name = '太郎'
      @user.furigana_last_name = 'ヤマダ'
      @user.furigana_first_name = 'タロウ'
      expect(@user).to be_valid
    end
  end

  context  'ユーザ登録ができない時' do
    it 'nicknameが空では登録できない' do
      # user = FactoryBot.build(:user)
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it 'emailは@を含まないと登録できない' do
      @user.email = 'testmail'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end
    it 'passwordが6文字以上であること' do
      @user.password = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
    end
    it 'passwordは半角英数字混合であること' do
      @user.password = 'password'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
    it '数字のみでは登録できないこと' do
      @user.password = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password は半角英数字混合で入力してください"
    end
    it '全角だと登録できないこと' do
      @user.password = 'パスワード'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password は半角英数字混合で入力してください"
    end
    it 'emailが一意性であること' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include "Email has already been taken"
      # 〜【解答6】PicTweetのモデルの単体テストコードを書こう〜を参考
    end
    it 'password_confirmationが空では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
    it 'passwordとpassword_confirmationは一致すること' do
      @user.password_confirmation = 'mismatched_password'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
    it 'last_nameが空では登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name can't be blank"
    end
    it 'first_nameが空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end
    it 'furigana_last_nameが空では登録できない' do
      @user.furigana_last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Furigana last name can't be blank"
    end
    it 'furigana_first_nameが空では登録できない' do
      @user.furigana_first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Furigana first name can't be blank"
    end
    it 'お名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
      @user.last_name = 'Smith'
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name は全角文字で入力してください"
    end
    it 'お名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
      @user.first_name = 'John'
      @user.valid?
      expect(@user.errors.full_messages).to include "First name は全角文字で入力してください"
    end
    it 'お名前カナ(全角)は、全角（カタカナ）での入力が必須であること' do
      @user.furigana_last_name = 'すみす'
      @user.valid?
      expect(@user.errors.full_messages).to include "Furigana last name は全角カナ文字で入力してください"
    end
    it 'お名前カナ(全角)は、全角（カタカナ）での入力が必須であること' do
      @user.furigana_first_name = 'たろう'
      @user.valid?
      expect(@user.errors.full_messages).to include  "Furigana first name は全角カナ文字で入力してください"
    end

    it 'birthdayが空では登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Birthday can't be blank"
    end
  end
  # pending "add some examples to (or delete) #{__FILE__}"
end



#今 rails7でゆーざーかんりきのうのモデル単体テストを実装しています。

# ・FactoryBotとuserもでるのバリデーションは以下の通りです

# ・テストの項目として確かめたい内容は以下です。

# ・すでにuser_spec.rbでは以下まで作成ずみなので残りのテストを上記をふまえてさくせいしてください。

# 日本語のFakerをする際は、 faker 日本語rails と調べて、gemを導入する。
# gimei が日本語のgem

# パスワードは、半角英数字混合での入力が必須であることだけ、validateに追加記載必要。
# 他はdeviseに搭載されているから不要。

# user = User.new(nickname: '', email: 'test@example', password: '000000', password_confirmation: '000000' , last_name: 'aaaaa', first_name: 'aaaaa' , furigana_last_name: 'aaaaa', furigana_first_name: 'aaaaa', birthday:'2022-08-02')
