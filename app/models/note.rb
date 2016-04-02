class Note < ActiveRecord::Base
	belongs_to :examnote
	validates :page, presence: true
	has_attached_file :page, styles: { medium: "400*400#"}
	validates_attachment_content_type :page, content_type: /\Aimage\/.*\Z/
end
