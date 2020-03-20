class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update, :destroy]
	before_action :set_store
	#helper_method :change_status_path
	def index
		@users = @store.users
	end
	def new
		@user= @store.users.new
	end

	def create
		@user = @store.users.new(user_params)
		respond_to do |format|
			if @user.save
				session[:user_id] = @user.id
				format.html { redirect_to store_path(@store), notice: "Confirmation mail has been sended to the #{@user.email },Please confim the mail after you can login " }
				format.json { render :show, status: :created, location: @user }
			else
				format.html { render :new }
				format.json { render json: @user.errors, status: :unprocessable_entity }
			end
		end
	end
	def destroy
		respond_to do |format|
			if @user == current_user
				format.html { redirect_to store_users_url, notice: "Hmmm.... Are you deleting yourself ??!!!!!!!" }
				format.json { render :show, status: :created, location: @user }
			else
				@user.destroy
					format.html { redirect_to store_users_url, notice: 'User was successfully destroyed.' }
					format.json { head :no_content }
			end
		end
	end
# 	def change_status
# 	  if @user.status?
# 	    @user.update_attribute(:status, false)
# 	  else
# 	    @user.update_attribute(:status, true)
# 	  end 
# end
	private
		def set_store
			@store = Store.find_by_slug(params[:store_slug]) or not_found
		end
		def set_user
			@user = User.find_by(id: params[:id])
		end
		def user_params
			params.require(:user).permit(:name, :email, :password, :password_confirmation , :MobileNo)
		end
	end
