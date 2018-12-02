class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.integer :year
      t.decimal :price
      t.string :genre
      t.text :description

      t.timestamps
    end
  end
end
