class Scene < ApplicationRecord
  has_many :tourist_spots, dependent: :destroy

  attachment :image
end
