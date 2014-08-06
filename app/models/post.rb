class Post < ActiveRecord::Base
  belongs_to :location

  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]

	def should_generate_new_friendly_id?
	  slug.blank? || title_changed?
	end

  validates :title, :content, :location_id, presence: true



end
