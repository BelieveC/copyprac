class ExamnotesController < ApplicationController
	before_action :get_examnote, only:[:show,:edit,:update,:destroy]

	def index
		@examnotes = Examnote.all.order("created_at DESC")
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
			params.require(:examnote).permit(:subject,:topic,:tips,notes_attributes:[:id,:page,:_destroy])
		end

		def get_examnote
			@examnote = Examnote.find(params[:id])
		end
end
