class AddUsersIdToSneakers < ActiveRecord::Migration
  def change
    add_column :sneakers, :user_id, :integer
  end
end
