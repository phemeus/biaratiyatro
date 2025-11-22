class Staff < ApplicationFirebaseModel
  attribute :name, :string
  attribute :role, :string
  attribute :bio, :string
  attribute :photo_url, :string

  validates :name, presence: true
end
