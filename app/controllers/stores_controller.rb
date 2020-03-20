class StoresController < ApplicationController
	before_action :set_store ,only: [:show]

	def index
		redirect_to root_path
	end

	def show;end

	def edit;end

	def update;end

	private
		def set_store
			@store = Store.find_by_slug(params[:slug]) or not_found
		end
	end
