class AddAttachmentSneakerImgToSneakers < ActiveRecord::Migration
  def self.up
    change_table :sneakers do |t|
      t.attachment :sneaker_img
    end
  end

  def self.down
    remove_attachment :sneakers, :sneaker_img
  end
end
