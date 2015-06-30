class AddStoreIdToHome < ActiveRecord::Migration
  def change
    add_column :homes, :store_id, :integer
  end
end
