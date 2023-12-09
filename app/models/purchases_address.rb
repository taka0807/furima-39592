class PurchasesAddress
	include ActiveModel::Model
	attr_accessor :post_code, :region_of_origin_id, :municipalities, :street_address, :building_name, :telephone_number, :token, :user_id, :item_id

	with_options presence: true do
    validates :post_code, format: { with: /\A\d{3}-\d{4}\z/, message: "は「3桁ハイフン4桁」の形式で入力してください" }
    validates :region_of_origin_id, numericality: { other_than: 1 , message: "can't be blank" }
    validates :municipalities
    validates :street_address
    validates :telephone_number, format: { with: /\A\d{10,11}\z/, message: "は10桁以上11桁以内の半角数値で入力してください" }
    validates :token
    validates :user_id
    validates :item_id
  end

  def save
    # 購入情報を保存し、変数purchaseに代入する
    purchase = Purchase.create(user_id: user_id, item_id: item_id) # item_id はフォームから渡されたアイテムのIDと仮定しています

    # 住所を保存する
    Address.create(
      post_code: post_code,
      region_of_origin_id: region_of_origin_id,
      municipalities: municipalities,
      street_address: street_address,
      building_name: building_name,
      telephone_number: telephone_number,
      purchase_id: purchase.id
    )
  end
end