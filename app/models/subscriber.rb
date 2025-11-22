class Subscriber < ApplicationFirebaseModel
  attribute :email, :string

  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end
