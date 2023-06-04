class User < ApplicationRecord
  validates_presence_of :name,
                        :username,
                        :email,
                        :password_digest
  validates_presence_of :password, confirmation: {case_sensitive: true}
  validates_uniqueness_of :email

  has_secure_password

  def self.from_omniauth(response)
    User.find_or_create_by(uid: response[:uid], provider: response[:provider]) do |user|
      user.name = response[:info][:name]
      user.email = response[:info][:email]
      user.password = SecureRandom.hex(15)
    end
  end
end