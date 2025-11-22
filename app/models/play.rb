class Play < ApplicationFirebaseModel
  attribute :title, :string
  attribute :description, :string
  attribute :date, :datetime
  attribute :image_url, :string
  attribute :youtube_url, :string

  validates :title, presence: true
end
