class Bicycle < ApplicationRecord
  has_many :pictures, as: :imageable
  accepts_nested_attributes_for :pictures, allow_destroy: true
  belongs_to :category
  belongs_to :user
  validates :name, uniqueness: true

	def self.search(search)
	  if search
	    Bicycle.where('name LIKE :query OR description LIKE :query', query: "%#{search.downcase}%")
	  else
	    Bicycle.all
	  end
	end
end
