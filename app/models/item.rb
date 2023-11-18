class Item < ApplicationRecord
belongs_to :user
extend ActiveHash::Associations::ActiveRecordExtensions
belongs_to :category
has_one :purchase
has_one_attached :image

validates :image, presence: true
	validates :productname, presence: true
	validates :explanation, presence: true
	validates :category, presence: true
	validates :product_condition, presence: true
	validates :pay_of_shipping, presence: true
	validates :region_of_origin, presence: true
	validates :number_of_days_until_shipping, presence: true
	validates :price, presence: true


end
