class Store < ApplicationRecord
	has_many :users, dependent: :destroy
	before_create :default_slug

	def default_slug
		o = [('a'..'z'), ('A'..'Z'),(0..9)].map(&:to_a).flatten
		str = (0..5).map { o[rand(o.length)] }.join
 		if self.slug.nil? == true || self.slug.blank? == true || self.slug.class != Integer
			self.slug = str
	 	end
  end
end
