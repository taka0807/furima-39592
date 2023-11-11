class AddFuriganaLastNameToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :furigana_last_name, :string
  end
end
