class User < ApplicationRecord
  validates_presence_of :name,
                        :username,
                        :email,
                        :password_digest
  validates_presence_of :password, confirmation: {case_sensitive: true}
  validates_uniqueness_of :email

  has_secure_password
end