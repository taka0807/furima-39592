class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :productname
      t.text   :explanation
      t.integer:category_id
      t.integer:product_condition_id
      t.integer:pay_of_shipping_id
      t.integer:region_of_origin_id
      t.integer:number_of_days_until_shipping_id
      t.integer:price
      t.references:user

      t.timestamps
    end
  end
end