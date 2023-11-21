require 'rails_helper'

RSpec.describe Item, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  before do
    # @user = FactoryBot.create(:user) # テスト用のユーザーを作成
    @item = FactoryBot.build(:item) # テスト用のItemを作成し、関連付け
  end

  context '商品登録ができる時' do
    it '正常に商品が登録できること' do
      expect(@item).to be_valid
    end
  end

  context '商品登録ができない時' do
    it '商品名が空では登録できない' do
      @item.productname = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Productname can't be blank"
    end

    it '説明が空では登録できない' do
      @item.explanation = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Explanation can't be blank"
    end

    it 'カテゴリーが選択されていないと登録できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include "Category can't be blank"
    end

    it '商品の状態が選択されていないと登録できない' do
      @item.product_condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include "Product condition can't be blank"
    end

    it '配送料の負担が選択されていないと登録できない' do
      @item.pay_of_shipping_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include "Pay of shipping can't be blank"
    end

    it '発送元の地域が選択されていないと登録できない' do
      @item.region_of_origin_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include "Region of origin can't be blank"
    end

    it '発送までの日数が選択されていないと登録できない' do
      @item.number_of_days_until_shipping_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include "Number of days until shipping can't be blank"
    end

    it '価格が空では登録できない' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Price can't be blank"
    end

    it '画像が添付されていないと登録できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Image can't be blank"
    end

    it 'Userが紐づいていないと保存できないこと' do
      @item.user = nil # Userをnilに設定
      @item.valid?
      expect(@item.errors.full_messages).to include 'User must exist'
    end

    # 他の商品登録失敗パターンのテストも同様に記述できます
      it '商品価格に関する半角数字以外の値が含まれている場合は保存できないこと' do
        @item.price = '５００'  # 半角数字以外の値を代入
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is not a number'
      end

      it '300未満の値では保存できないこと' do
        @item.price = 299  # 300未満の値を代入
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be greater than or equal to 300'
      end

      it '10000000以上の値では保存できないこと' do
        @item.price = 10_000_000  # 10000000以上の値を代入
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be less than or equal to 9999999'
      end
    end
  end
