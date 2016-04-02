class Examnote < ActiveRecord::Base
	has_many :notes
	accepts_nested_attributes_for :notes, reject_if: :all_blank, allow_destroy: true

end
