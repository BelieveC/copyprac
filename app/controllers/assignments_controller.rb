class AssignmentsController < ApplicationController
	before_action :get_assignment,only: [:show,:edit,:update,:destroy]
	def index
		@assignments = Assignment.all.order("created_at ASC")
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
			params.require(:assignment).permit(:topic,:subject_id,:college_id,:description,:teacher)
		end

		def get_assignment
			@assignment = Assignment.find(params[:id])
		end
end
