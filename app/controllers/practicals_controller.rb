class PracticalsController < ApplicationController
	before_action :get_pratical, only:[:show,:edit,:update,:destroy]
	def about
	end

	def index
		if params[:college].blank? && params[:subject].blank? && params[:search].blank?
			@practicals = Practical.all.order("created_at DESC")
		elsif !params[:college].blank?
			@practicals = Practical.where(college_id: params[:college]).order("created_at DESC")
		elsif params[:subject].present?
			@practicals = Practical.where(subject_id: params[:subject]).order("created_at DESC")
		else
			@query = params[:search]
			@practicals = Practical.search(params[:search])
		end
	end

	def show
	end

	def new
		@practical = Practical.new
	end

	def create
		@practical = Practical.new(pratical_params)
		if @practical.save
			redirect_to @practical
		else
			render('new')
		end
	end

	def edit
	end

	def update
		if @practical.update(pratical_params)
			redirect_to @practical
		else
			render('edit')
		end
	end

	def destroy
		@practical.destroy
		redirect_to practicals_path
	end
	private
		def pratical_params
			params.require(:practical).permit(:aim,:description,:subject_id,:college_id,images_attributes: [:id,:sheet,:_destroy])
		end

		def get_pratical
			@practical = Practical.find(params[:id])
		end
end
