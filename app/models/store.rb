class Store < ApplicationRecord
	has_many :users, dependent: :destroy
	accepts_nested_attributes_for :users
	before_create :set_slug

	#gererate default slug before create record
	def set_slug
		o = [('a'..'z'), ('A'..'Z'),(0..9)].map(&:to_a).flatten
		str = (0..5).map { o[rand(o.length)] }.join
		if self.slug.nil? == true || self.slug.blank? == true || self.slug.class != Integer
			self.slug = str
		end
	end

	#method for  use slug instead of id
	def to_param
		slug
	end
end
