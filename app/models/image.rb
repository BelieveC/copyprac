class Image < ActiveRecord::Base
	belongs_to :practical

  validates :sheet,:title,:description, presence: true
  has_attached_file :sheet, styles: { medium: "400*400#"}
  validates_attachment_content_type :sheet, content_type: /\Aimage\/.*\Z/
end
