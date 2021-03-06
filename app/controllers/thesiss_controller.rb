class ThesissController < ApplicationController
	before_action :get_thesis, only:[:show,:edit,:update,:destroy]

	def index
		if params[:subject].blank? && params[:search].blank?
			@thesiss = Thesis.all.order("created_at DESC")
		elsif params[:subject].present?
			@thesiss = Thesis.where(subject_id: params[:subject]).order("created_at ASC")
		else
			@query = params[:search]
			@thesiss = Thesis.search(params[:search])
		end
	end

	def show
	end

	def new
		@thesis= Thesis.new
	end

	def create
		@thesis= Thesis.new(thesisparams)
		if @thesis.save
			redirect_to thesiss_path(@thesis)
		else
			render('new')
		end
	end

	def edit
	end

	def update
		if @thesis.update(thesisparams)
			redirect_to thesiss_path(@thesis)
		else
			render('edit')
		end
	end

	def destroy
		@thesis.destroy
		redirect_to thesiss_index_path
	end

	private
		def thesisparams
			params.require(:thesis).permit(:subject_id,:topic,:duration,:publisher,:description,:reasearchers,thesisimages_attributes:[:id,:paper,:_destroy])
		end

		def get_thesis
			@thesis= Thesis.find(params[:id])
		end
end
