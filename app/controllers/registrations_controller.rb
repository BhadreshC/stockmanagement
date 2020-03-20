class RegistrationsController < Devise::RegistrationsController
	before_action :configure_sign_up_params, only: [:create]

	def new
		@store = Store.new
		@store.users.build
	end

	def create
		@store = Store.new(configure_sign_up_params)
		@user = User.new()
		if @store.save
			redirect_to store_path(@store), notice: 'store was successfully created.'
		else
			render :new
		end
	end

	def update
		super
	end

private
	def configure_sign_up_params
		params.require(:store).permit(:name, users_attributes: [:name, :email, :password, :password_confirmation])
	end
end
