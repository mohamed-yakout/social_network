class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :original_url
      t.string :shorten_url

      t.timestamps
    end
    add_index :users, :original_url, unique: true
  end
end
