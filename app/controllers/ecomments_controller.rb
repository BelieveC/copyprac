class EcommentsController < ApplicationController
	before_action :get_examnote
	def create
		@ecomment = @examnote.ecomments.create(ecomment_params)
		redirect_to @examnote
	end

	def destroy
		@ecomment = @examnote.ecomments.find(params[:id])
		@ecomment.destroy
		redirect_to @examnote
	end

	private
		def get_examnote
			@examnote = Examnote.find(params[:examnote_id])
		end

		def ecomment_params
			params.require(:ecomment).permit(:examnote_id,:body)
		end

end
