class Bicycle < ApplicationRecord
  has_many :pictures, as: :imageable
  accepts_nested_attributes_for :pictures, allow_destroy: true
  belongs_to :category
  validates :name, uniqueness: true

	def self.search(search)
	  if search
	    Bicycle.where('name LIKE ?', "%#{search}%")
	  else
	    Bicycle.all
	  end
	end
end
