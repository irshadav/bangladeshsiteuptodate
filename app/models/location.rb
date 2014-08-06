class Location < ActiveRecord::Base
  include Tree
  has_ancestry :cache_depth => true

  has_many :posts

  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]

	def should_generate_new_friendly_id?
	  slug.blank? || name_changed?
	end

end
