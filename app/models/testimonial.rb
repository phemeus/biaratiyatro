class Testimonial < ApplicationFirebaseModel
  attribute :name, :string
  attribute :title, :string
  attribute :comment, :string

  validates :name, presence: true
  validates :comment, presence: true
end
