class AddFuriganaFirstNameToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :furigana_first_name, :string
  end
end
