class GalleryImage < ApplicationFirebaseModel
  attribute :title, :string
  attribute :url, :string

  validates :url, presence: true
end
