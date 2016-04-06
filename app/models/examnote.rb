class Examnote < ActiveRecord::Base
	searchkick
	has_many :notes
	has_many :ecomments
	accepts_nested_attributes_for :notes, reject_if: :all_blank, allow_destroy: true

end
