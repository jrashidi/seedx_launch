class SignupQueue < ApplicationRecord
  has_secure_token :user_hash
  validates :email, presence: true, uniqueness: true

  def self.get_position_in_queue(id, count_invited_users)
    SignupQueue.count_by_sql ["SELECT COUNT(id) FROM signup_queues 
    WHERE id < ? AND invited_users_count = ?
    OR invited_users_count > ?", id, count_invited_users, count_invited_users]
  end

end
