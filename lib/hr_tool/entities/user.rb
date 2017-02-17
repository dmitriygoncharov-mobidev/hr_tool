class User < Hanami::Entity
  EMAIL_FORMAT = /\@/

  attributes do
    attribute :id,        Types::Int
    attribute :name,      Types::String
    attribute :google_id, Types::String
    attribute :email,     Types::String.constrained(format: EMAIL_FORMAT)
  end
end
