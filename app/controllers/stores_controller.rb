class StoresController < ApplicationController
	before_action :set_store ,only: [:show]# ,:check_permission,
	# before_action :check_session

	def index
		redirect_to root_url
	end

	def show
	end
	private
		def set_store
			@store = Store.find_by(id: params[:id]) or not_found
		end
end
