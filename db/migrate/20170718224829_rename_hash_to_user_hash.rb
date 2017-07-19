class RenameHashToUserHash < ActiveRecord::Migration[5.0]
  def change
    rename_column :signup_queues, :hash, :user_hash
  end
end
