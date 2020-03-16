class User < ApplicationRecord
	devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :confirmable
	belongs_to :store

	def default_values
		self.status = false
	end

	def active_for_authentication?
		super && status?
	end

	def after_confirmation
		self.update_attribute(:status, true)
		end
end
