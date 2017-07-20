class AddUserHashUniqueIndex < ActiveRecord::Migration[5.0]
  def change
    add_index :signup_queues, :user_hash, unique: true
  end
end
