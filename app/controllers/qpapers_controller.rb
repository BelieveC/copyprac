class QpapersController < ApplicationController
	before_action :get_qpaper,only: [:show,:edit,:update,:destroy]
	def index
		if params[:college].blank? && params[:search].blank?
			@qpapers = Qpaper.all.order("created_at ASC")
		elsif params[:college].present?
			@qpapers = Qpaper.where(college_id: params[:college]).order("created_at ASC")
		elsif params[:search].present?
			@query = params[:search]
			@qpapers = Qpaper.search(params[:search])
		else
			@qpapers = Qpaper.where(subject_id: params[:subject])
		end
	end
	def show
	end
	def new
		@qpaper = Qpaper.new
	end
	def create
		@qpaper = Qpaper.new(qpaper_params)
		if @qpaper.save
			redirect_to @qpaper
		else
			render 'new'
		end
	end
	def edit
	end
	def update
		if @qpaper.update(qpaper_params)
			redirect_to @qpaper
		else
			render 'edit'
		end
	end
	def destroy
		@qpaper.destroy
		redirect_to qpapers_path
	end

	private
		def get_qpaper
			@qpaper = Qpaper.find(params[:id])
		end

		def qpaper_params
			params.require(:qpaper).permit(:subject,:teacher,:date,:examname,:subject_id,:college_id,qimages_attributes: [:id,:image,:_destroy])
		end
end
