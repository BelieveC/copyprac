class Thesis < ActiveRecord::Base
	searchkick
	has_many :thesisimages
	has_many :tcomments
	accepts_nested_attributes_for :thesisimages, reject_if: :all_blank, allow_destroy: true
end
