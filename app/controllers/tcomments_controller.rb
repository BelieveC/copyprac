class TcommentsController < ApplicationController
	before_action :get_thesis
	def create
		@thesis.tcomments.create(tcomment_params)
		redirect_to thesiss_path(@thesis)
	end

	def destroy
		@tcomment = @thesis.tcomments.find(params[:id])
		@tcomment.destroy
	end

	private

		def get_thesis
			@thesis = Thesis.find(params[:thesis_id])
		end

		def tcomments_params
			params.require(:tcomment).permit(:thesis_id,:body)
		end
end

