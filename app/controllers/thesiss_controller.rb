class ThesissController < ApplicationController
	before_action :get_thesis, only:[:show,:edit,:update,:destroy]

	def index
		@thesiss = Thesis.all.order("created_at DESC")
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
		redirect_to thesis_path
	end

	private
		def thesisparams
			params.require(:thesis).permit(:subject,:topic,:duration,:publisher,:description,:researchers,thsesisimages_attributes:[:id,:paper,:_destroy])
		end

		def get_thesisi
			@thesis= Thesis.find(params[:id])
		end
end
