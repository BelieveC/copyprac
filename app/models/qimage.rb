class Qimage < ActiveRecord::Base
	belongs_to :qpaper
	validates :image, presence: true
  	has_attached_file :image, styles: { medium: "400*400#"}
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
