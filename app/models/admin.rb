class Admin < ApplicationRecord

  def self.authenticate(login, password)
    admin = find_by_password(password)
    if admin && admin.login == login
      admin
    else
      nil
    end
  end

end
