class CreateHeadings < ActiveRecord::Migration[5.2]
  def change
    create_table :headings do |t|
      t.references :user, foreign_key: true
      t.string :html_element
      t.string :html_value
      t.string :html_type

      t.timestamps
    end
  end
end
