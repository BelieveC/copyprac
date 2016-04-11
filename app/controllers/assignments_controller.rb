class AssignmentsController < ApplicationController
	before_action :get_assignment,only: [:show,:edit,:update,:destroy]
	def index
		if params[:college].blank? && params[:search].blank? && params[:subject].blank?
			@assignments = Assignment.all.order("created_at ASC")
		elsif params[:college].present?
			@assignments = Assignment.where(college_id: params[:college]).order("created_at ASC")
		elsif params[:search].present?
			@query = params[:search]
			@assignments = Assignment.search(params[:search])
		else
			@assignments = Assignment.where(subject_id: params[:subject])
		end
	end

	def show
	end

	def edit
	end

	def update
		if @assignment.update(assignment_params)
			redirect_to @assignment
		else
			render('edit')
		end
	end

	def new
		@assignment = Assignment.new
	end

	def create
		@assignment = Assignment.new(assignment_params)
		if @assignment.save
			redirect_to @assignment
		else
			render('new')
		end
	end

	def destroy
		@assignment.destroy
		redirect_to assignments_path
	end

	private
		def assignment_params
			params.require(:assignment).permit(:topic,:subject_id,:college_id,:description,:teacher,aimages_attributes: [:id,:image,:_destroy])
		end

		def get_assignment
			@assignment = Assignment.find(params[:id])
		end
end
