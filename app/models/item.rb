class Item < ApplicationRecord
belongs_to :user
extend ActiveHash::Associations::ActiveRecordExtensions
belongs_to :category
belongs_to :product_condition
belongs_to :pay_of_shipping
belongs_to :region_of_origin
belongs_to :number_of_days_until_shipping
has_one :purchase
has_one_attached :image

validates :image, presence: true
	validates :productname, presence: true
	validates :explanation, presence: true
	validates :category_id, presence: true, numericality: { other_than: 1 , message: "Category can't be blank" }
	validates :product_condition_id, presence: true, numericality: { other_than: 1 , message: "Product condition can't be blank" }
	validates :pay_of_shipping_id, presence: true, numericality: { other_than: 1 , message: "Pay of shipping can't be blank" }
	validates :region_of_origin_id, presence: true, numericality: { other_than: 1 , message: "Region of origin can't be blank" }
	validates :number_of_days_until_shipping_id, presence: true, numericality: { other_than: 1 , message: "Number of days until shipping can't be blank" }
	validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
end
