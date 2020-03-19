class StoresController < ApplicationController
	before_action :set_store ,only: [:show]# ,:check_permission,
	# before_action :check_session

	def index
		#redirect_to root_path
	end

	def show
	end
	def edit
		puts "jjkkjjgkhjhjkhkjhkj"
		puts "jjkkjjgkhjhjkhkjhkj"
		puts "jjkkjjgkhjhjkhkjhkj"
	end
	def update

	end
	private
		def set_store
			@store = Store.find_by_slug(params[:slug]) or not_found
		end
	end
