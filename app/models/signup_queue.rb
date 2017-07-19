class SignupQueue < ApplicationRecord
  has_secure_token :user_hash
end
