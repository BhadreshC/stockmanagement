class User < ApplicationRecord
	belongs_to :store
	devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :confirmable
	#validates :name, presence:true
	#validates :MobileNo, presence:true, length: {minimum: 10, maximum: 10, too_short:'should be 10 digits ', too_long: 'should be 10 digits '}
	#validates :email, presence: true, uniqueness: {scope: :store_id }, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
	def default_values
		self.status = true
	end

	def active_for_authentication?
		super && status?
	end

	# def after_confirmation
	# 	self.update_attribute(:status, true)
	# end
end
