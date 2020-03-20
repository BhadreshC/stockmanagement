class Product < ApplicationRecord
	belongs_to :store
	before_create :set_slug
	validates :title, presence:true
	validates :description, presence:true

	#gererate default slug before create record
	def set_slug
		o = [('a'..'z'), ('A'..'Z'),(0..9)].map(&:to_a).flatten
		str = (0..5).map { o[rand(o.length)] }.join
		if self.slug.nil? == true || self.slug.blank? == true || self.slug.class != Integer
			self.slug = 'pro_'+str
		end
	end

	#method for  use slug instead of id
	def to_param
		slug
	end
end
