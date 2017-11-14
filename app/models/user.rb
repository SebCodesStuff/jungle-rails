class User < ActiveRecord::Base

  has_many :reviews

  has_secure_password
  validates :email, uniqueness: true
  validates :email, presence: true
  validates :name, presence: true
  validates :password_digest, length: {minimum: 4}

end
