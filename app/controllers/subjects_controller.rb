class SubjectsController < ApplicationController
	def new
		subject = Subject.new
	end

	def index
		subjects = Subject.all.order("name ASC")
	end

	def show
	end

	def create
		subject = Subject.new(subject_params)
		if subject.save
			redirect_to subjects_path
		else
			render('new')
		end
	end

	def edit
	end

	def update
		if subject.update(subject_params)
			redirect_to subjects_path
		else
			render('edit')
		end
	end

	def destroy
		subject.destroy
		redirect_to subjects_path
	end

	private

		def subject_params
			params.require(:college).permit(:name)
		end

		def get_subject
			subject = Subject.find[params[:id]]
		end

end
