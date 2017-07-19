class CreateSignupQueues < ActiveRecord::Migration[5.0]
  def change
    create_table :signup_queues do |t|
      t.string :email
      t.string :hash
      t.integer :invited_by_user_id
      t.integer :invited_users_count

      t.timestamps
    end
  end
end
