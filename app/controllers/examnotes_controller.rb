class ExamnotesController < ApplicationController
	before_action :get_examnote, only:[:show,:edit,:update,:destroy]

	def index
		if params[:college].blank? && params[:subject].blank? && params[:search].blank?
			@examnotes = Examnote.all.order("created_at DESC")
		elsif !params[:college].blank?
			@examnotes = Examnote.where(college_id: params[:college]).order("created_at DESC")
		elsif params[:subject].present?
			@examnotes = Examnote.where(subject_id: params[:subject]).order("created_at DESC")
		else
			@query = params[:search]
			@examnotes = Examnote.search(params[:search])
		end
	end

	def show
	end

	def new
		@examnote = Examnote.new
	end

	def create
		@examnote = Examnote.new(examnote_params)
		if @examnote.save
			redirect_to @examnote
		else
			render('new')
		end
	end

	def edit
	end

	def update
		if @examnote.update(examnote_params)
			redirect_to @examnote
		else
			render('edit')
		end
	end

	def destroy
		@examnote.destroy
		redirect_to examnotes_path
	end

	private
		def examnote_params
			params.require(:examnote).permit(:subject_id,:college_id,:topic,:tips,notes_attributes:[:id,:page,:_destroy])
		end

		def get_examnote
			@examnote = Examnote.find(params[:id])
		end
end
