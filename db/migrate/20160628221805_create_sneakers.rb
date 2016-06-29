class CreateSneakers < ActiveRecord::Migration
  def change
    create_table :sneakers do |t|
      t.string :title
      t.text :detail
      t.decimal :price

      t.timestamps null: false
    end
  end
end
