class Item < ApplicationRecord
belongs_to :user
extend ActiveHash::Associations::ActiveRecordExtensions
belongs_to :category
belongs_to :product_condition
belongs_to :pay_of_shipping
belongs_to :region_of_origin
belongs_to :number_of_days_until_shipping
# has_one :purchase
has_one_attached :image

validates :image, presence: true
	validates :productname, presence: true
	validates :explanation, presence: true
	validates :category_id, presence: true, numericality: { other_than: 1 }
	validates :product_condition_id, presence: true, numericality: { other_than: 1 }
	validates :pay_of_shipping_id, presence: true, numericality: { other_than: 1 }
	validates :region_of_origin_id, presence: true, numericality: { other_than: 1 }
	validates :number_of_days_until_shipping_id, presence: true, numericality: { other_than: 1 }
	validates :price, presence: true


end
