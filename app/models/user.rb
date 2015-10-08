class User < ActiveRecord::Base
  def create_user! hash_keys
    hash_keys[:session_token] = SecureRandom.base64
    User.create!(hash_keys)
  end
end
