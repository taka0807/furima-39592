class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.order(created_at: :desc)
  end

  def show
    # @item = Item.find(params[:id])
  end

def new
  @item = Item.new
end

def edit
  # 売却済み、またはログインユーザーが出品者でない場合、トップページにリダイレクト
  if @item.purchase.present? || current_user != @item.user
    redirect_to root_path, alert: 'You are not authorized to edit this item.'
  end
end


def update
  # @item = Item.find(params[:id])
  if @item.update(item_params)
    redirect_to item_path(@item)
  else
    render :edit, status: :unprocessable_entity
  end
end


def create
  @item = Item.new(item_params)
  if @item.save
    redirect_to root_path
  else
    render :new, status: :unprocessable_entity
  end
end

def destroy
  if current_user == @item.user # ログインユーザーが出品者か確認
    @item.destroy
    redirect_to root_path, notice: 'Item was successfully deleted.'
  else
    redirect_to root_path, alert: 'You are not authorized to delete this item.'
  end
end

private
def set_item
  @item = Item.find(params[:id])
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
