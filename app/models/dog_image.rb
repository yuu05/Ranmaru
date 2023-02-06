class DogImage < ApplicationRecord

  belongs_to :user
  attachment :image

  validates :title, presence: true
  validates :image, presence: true
end