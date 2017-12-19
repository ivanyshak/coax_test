class Category < ApplicationRecord
	has_many :bicycles, dependent: :destroy
end
