class RequestsController < ApplicationController
	before_action :get_request, only:[:show,:edit,:update,:destroy]
	def index
		if params[:subject].blank?
			@requests = Request.all.order("created_at DESC")
		else
			@requests = Request.where(subject_id: params[:subject]).order("created_at DESC")
		end
	end
	def show
	end
	def new
		@request = Request.new
	end
	def update
		if @request.update(request_params)
			redirect_to requests_path
		else
			render('edit')
		end
	end
	def edit
	end
	def create
		@request = Request.new(request_params)
		if @request.save
			redirect_to requests_path
		else
			render 'new'
		end
	end
	def destroy
		@request.destroy
		redirect_to requests_path
	end

	private
		def get_request
			@request = Request.find(params[:id])
		end

		def request_params
			params.require(:request).permit(:name,:type_id,:subject_id,:description)
		end
end
