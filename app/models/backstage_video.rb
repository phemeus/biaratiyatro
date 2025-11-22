class BackstageVideo < ApplicationFirebaseModel
  attribute :title, :string
  attribute :youtube_url, :string
  attribute :description, :string

  validates :title, presence: true
  validates :youtube_url, presence: true
end
