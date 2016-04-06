class CollegesController < ApplicationController
	before_action :get_college, only:[:edit,:update,:destroy,:show]
	def new
		@college = College.new
	end

	def index
		if params[:search].blank?
			@colleges = College.all.order("name ASC")
		else
			@query = params[:search]
			@colleges = College.search(params[:search])
		end
	end

	def show
	end

	def create
		@college = College.new(college_params)
		if @college.save
			redirect_to colleges_path
		else
			render('new')
		end
	end

	def edit
	end

	def update
		if @college.update(college_params)
			redirect_to colleges_path
		else
			render('edit')
		end
	end

	def destroy
		@college.destroy
		redirect_to colleges_path
	end

	private

		def college_params
			params.require(:college).permit(:name,:address)
		end

		def get_college
			@college = College.find(params[:id])
		end
end
