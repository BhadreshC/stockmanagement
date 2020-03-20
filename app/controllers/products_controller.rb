class ProductsController < ApplicationController
	before_action :set_product, only: [:show, :edit, :update, :destroy]
	before_action :set_store
	def index
		@products = Product.all
	end

	def show
	end

	def new
		@product = Product.new
	end

	def edit
	end

	def create
		@product = @store.products.new(product_params)
		respond_to do |format|
			if @product.save
				format.html { redirect_to store_product_path(@store, @product), notice: 'Product was successfully created.' }
				format.json { render :show, status: :created, location: @product }
			else
				format.html { render :new }
				format.json { render json: @product.errors, status: :unprocessable_entity }
			end
		end
	end

	def update
		respond_to do |format|
			if @product.update(product_params)
				format.html { redirect_to store_product_path(@store, @product), notice: 'Product was successfully updated.' }
				format.json { render :show, status: :ok, location: @product }
			else
				format.html { render :edit }
				format.json { render json: @product.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		@product.destroy
		respond_to do |format|
			format.html { redirect_to store_products_url, notice: 'Product was successfully destroyed.' }
			format.json { head :no_content }
		end
	end

	private
		def set_store
			@store = Store.find_by_slug(params[:store_slug]) or not_found
		end
		def set_product
			@product = Product.find_by_slug(params[:slug]) or not_found
		end
		def product_params
			params.require(:product).permit(:title, :description)
		end
end
