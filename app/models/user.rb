class User < ApplicationRecord

def self.authenticate(name, encrypted_code)
  user = find_by_encrypted_code(encrypted_code)
  if user && user.name == name
    user
  else
    nil
  end
end


end
