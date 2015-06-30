class RemovePidToHome < ActiveRecord::Migration
  def change
    remove_column :homes, :pid, :serial
  end
end
