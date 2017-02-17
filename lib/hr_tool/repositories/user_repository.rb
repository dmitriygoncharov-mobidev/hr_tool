class UserRepository < Hanami::Repository
  def self.auth!(auth_hash)
    info = auth_hash[:info]
    google_id = info[:uid]
    attrs = {
      name:   info[:name],
      email:  info[:email],
    }

    if user = query { where(google_id: attrs[:google_id]) }.first
      user.update(attrs)
      update user
    else
      create(User.new(attrs.merge(google_id: google_id)))
    end
  end
end
