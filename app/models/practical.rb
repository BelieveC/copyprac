class Practical < ActiveRecord::Base
	searchkick
	has_many :images
	has_many :comments

	accepts_nested_attributes_for :images, reject_if: :all_blank, allow_destroy: true

end
