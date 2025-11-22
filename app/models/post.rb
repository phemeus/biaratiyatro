class Post < ApplicationFirebaseModel
  attribute :title, :string
  attribute :content, :string
  attribute :published_at, :datetime
  attribute :image_url, :string

  validates :title, presence: true
end
