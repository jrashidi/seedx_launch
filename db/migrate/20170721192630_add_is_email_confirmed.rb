class AddIsEmailConfirmed < ActiveRecord::Migration[5.0]
  def change
    add_column :signup_queues, :is_email_confirmed, :boolean, :default => false
  end
end
