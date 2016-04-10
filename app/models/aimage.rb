class Aimage < ActiveRecord::Base
	belongs_to :assignment
	validates :image, presence: true
  	has_attached_file :image, styles: { medium: "400*400#"}
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

end
