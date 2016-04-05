class Thesis < ActiveRecord::Base
	has_many :thesisimages
	has_many :tcomments
	accepts_nested_attributes_for :thesisimages, reject_if: :all_blank, allow_destroy: true
end
