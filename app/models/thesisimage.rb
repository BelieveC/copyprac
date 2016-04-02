class Thesisimage < ActiveRecord::Base
	belongs_to :thesis
	validates :paper, presence: true
  	has_attached_file :paper, styles: { medium: "400*400#"}
  	validates_attachment_content_type :sheet, content_type: /\Aimage\/.*\Z/
end
