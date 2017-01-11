class User < ApplicationRecord
  has_secure_password

  ROLES = %w[admin operator]

  def admin?
    self.role == 'admin'
  end
end
