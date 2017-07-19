class AddDefaultValueToInvitedUsersCount < ActiveRecord::Migration[5.0]
  def change
    change_column_default :signup_queues, :invited_users_count, 0
  end
end
