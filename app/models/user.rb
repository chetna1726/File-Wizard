class User < ApplicationRecord
  # has_secure_password

  validates :name, :email, presence: true
  validates :email, uniqueness: true, case_sensitive: false, format: /.+@.+\.{1}.{2,}/

  has_many :uploads

  def authenticate(password)
    password == self.password_digest
  end
end
