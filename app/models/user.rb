class User < ApplicationRecord
	devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :confirmable
	belongs_to :store
end
