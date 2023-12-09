require 'rails_helper'

RSpec.describe PurchasesAddress, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe '配送先情報の保存' do
    before do
      # userのFactoryBotを作成
      # itemのFactoryBotを作成
      # @purchases_address = FactoryBot.build(:purchases_address, item_id: ○○.id ,user_id: ○○.id)
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item, user: @user)
      @purchases_address = FactoryBot.build(:purchases_address, item_id: @item.id, user_id: @user.id)
      # @purchases_address = FactoryBot.build(:purchases_address)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchases_address).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @purchases_address.building_name = nil
        expect(@purchases_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できないこと' do
        @purchases_address.post_code = nil
        @purchases_address.valid?
        # expect(@purchases_address.errors.full_messages).to include("郵便番号が入力されていません。")
        expect(@purchases_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'postal_codeが正しい形式でないと保存できないこと' do
        @purchases_address.post_code = '1234567'
        @purchases_address.valid?
        # expect(@purchases_address.errors.full_messages).to include("郵便番号は「3桁ハイフン4桁」の形式で入力してください。")
        expect(@purchases_address.errors.full_messages).to include("Post code は「3桁ハイフン4桁」の形式で入力してください")
      end
      it 'region_of_origin_idが1だと保存できないこと' do
        @purchases_address.region_of_origin_id = 1
        @purchases_address.valid?
        expect(@purchases_address.errors.full_messages).to include("Region of origin can't be blank")
      end
      it 'municipalitiesが空だと保存できないこと' do
        @purchases_address.municipalities = nil
        @purchases_address.valid?
        # expect(@purchases_address.errors.full_messages).to include("市区町村が入力されていません。")
        expect(@purchases_address.errors.full_messages).to include("Municipalities can't be blank")
      end
      it 'street_addressが空だと保存できないこと' do
        @purchases_address.street_address = nil
        @purchases_address.valid?
        # expect(@purchases_address.errors.full_messages).to include("番地が入力されていません。")
        expect(@purchases_address.errors.full_messages).to include("Street address can't be blank")
      end
      it 'telephone_numberが空だと保存できないこと' do
        @purchases_address.telephone_number = nil
        @purchases_address.valid?
        # expect(@purchases_address.errors.full_messages).to include("電話番号が入力されていません。")
        expect(@purchases_address.errors.full_messages).to include("Telephone number can't be blank")
      end
      it 'telephone_numberが正しい形式でないと保存できないこと' do
        @purchases_address.telephone_number = '090-1234-5678'
        @purchases_address.valid?
        # expect(@purchases_address.errors.full_messages).to include("電話番号は10桁以上11桁以内の半角数値で入力してください。")
        expect(@purchases_address.errors.full_messages).to include("Telephone number は10桁以上11桁以内の半角数値で入力してください")
      end
      it 'telephone_numberが9桁以下だと保存できないこと' do
        @purchases_address.telephone_number = '123456789'
        @purchases_address.valid?
        expect(@purchases_address.errors.full_messages).to include("Telephone number は10桁以上11桁以内の半角数値で入力してください")
      end
      it 'telephone_numberが12桁以上だと保存できないこと' do
        @purchases_address.telephone_number = '123456789012'
        @purchases_address.valid?
        expect(@purchases_address.errors.full_messages).to include("Telephone number は10桁以上11桁以内の半角数値で入力してください")
      end


      # telephone_number9桁と12桁のテストコードをそれぞれ作成
      it 'userが紐付いていないと保存できないこと' do
        @purchases_address.user_id = nil
        @purchases_address.valid?
        # expect(@purchases_address.errors.full_messages).to include("Userを入力してください")
        expect(@purchases_address.errors.full_messages).to include("User can't be blank")
      end
      # itemのテストコード作成
      it 'itemが紐付いていないと保存できないこと' do
        @purchases_address.item_id = nil
        @purchases_address.valid?
        expect(@purchases_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空だと保存できないこと' do
        @purchases_address.token = nil
        @purchases_address.valid?
        expect(@purchases_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
