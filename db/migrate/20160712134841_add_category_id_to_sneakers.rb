class AddCategoryIdToSneakers < ActiveRecord::Migration
  def change
    add_column :sneakers, :category_id, :integer
  end
end
