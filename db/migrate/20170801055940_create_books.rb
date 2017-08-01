class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :image
      t.text :description
      t.decimal :price

      t.timestamps
    end
  end
end
