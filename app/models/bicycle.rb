class Bicycle < ApplicationRecord
  has_many :pictures, as: :imageable
end
