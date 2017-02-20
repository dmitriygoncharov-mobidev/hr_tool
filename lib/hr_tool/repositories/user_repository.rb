class UserRepository < Hanami::Repository
  def auth!(auth_hash)
    info = auth_hash[:info]
    google_id = auth_hash[:uid]
    attrs = {
      name:   info[:name],
      email:  info[:email],
    }

    if user = users.where(google_id: attrs[:google_id]).first
      user.update(attrs)
      update user
    else
      create(User.new(attrs.merge(google_id: google_id)))
    end
  end
end
