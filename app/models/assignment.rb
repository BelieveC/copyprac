class Assignment < ActiveRecord::Base
	searchkick
	has_many :aimages
	accepts_nested_attributes_for :aimages, reject_if: :all_blank, allow_destroy: true
end
