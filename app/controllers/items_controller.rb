class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
    @items = Item.order(created_at: :desc)
  end

  def show
    @item = Item.find(params[:id])
  end

def new
  @item = Item.new
end


def create
  @item = Item.new(item_params)
  if @item.save
    redirect_to root_path
  else
    render :new, status: :unprocessable_entity
  end
end


def item_params
  params.require(:item).permit(
    :productname, :explanation, :category_id, :product_condition_id,
    :pay_of_shipping_id, :region_of_origin_id, :number_of_days_until_shipping_id,
    :price, :user_id, :image
  ).merge(user_id: current_user.id)
end
end
# ユーザー管理機能時点に、@～を書いてしまってはダメ。
