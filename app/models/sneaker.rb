class Sneaker < ActiveRecord::Base
	belongs_to :user
	belongs_to :category

	has_attached_file :sneaker_img, styles: { sneaker_index: "250x250>", sneaker_show: "500x500>" }, 
	                                default_url: "/images/:style/missing.png"
    validates_attachment_content_type :sneaker_img, content_type: /\Aimage\/.*\Z/
end
