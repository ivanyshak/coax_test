class Bicycle < ApplicationRecord
  has_many :pictures, as: :imageable
  accepts_nested_attributes_for :pictures, allow_destroy: true
  belongs_to :category
  belongs_to :user
  validates :name, uniqueness: true


	scope :filter,   		 ->(query)    { where('name ILIKE :query OR description ILIKE :query', query: "%#{query.downcase}%") if query.present?}
	scope :w_category,   ->(type)     { where(category_id: type) if type.present? }

  def self.search(params)
    filter(params[:query])
    	.w_category(params[:category_id])
	    .paginate(page: params[:page], per_page: 6)
	end
end
