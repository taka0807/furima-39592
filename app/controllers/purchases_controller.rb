class PurchasesController < ApplicationController
	before_action :authenticate_user!
  before_action :set_item, only: [:index, :new, :create]
  before_action :redirect_if_owner_or_sold, only: [:index, :new, :create]

  # 新しい購入フォームを表示するためのアクション
  def new
    @purchase_address = PurchasesAddress.new
  end

  def create
    @purchase_address = PurchasesAddress.new(purchase_params)

    if @purchase_address.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: purchase_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
      @purchase_address.save

      redirect_to root_path, notice: 'Purchase was successful.'
    else
      render :index, status: :unprocessable_entity
    end
  end

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @item = Item.order(created_at: :desc).first
    @purchase_address = PurchasesAddress.new # フォームオブジェクトのインスタンスを生成し、インスタンス変数に代入する
    # 必要に応じて他の処理を追加する
  end


  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def redirect_if_owner_or_sold
    if current_user.id == @item.user_id || @item.purchase.present?
      redirect_to root_path, alert: 'Access denied.'
    end
  end

  def purchase_params
    params.require(:purchases_address).permit(:post_code, :region_of_origin_id, :municipalities, :street_address, :building_name, :telephone_number, :price )
          .merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

end
