class Qpaper < ActiveRecord::Base
	searchkick
	has_many :qimages
	accepts_nested_attributes_for :images, reject_if: :all_blank, allow_destroy: true
end
