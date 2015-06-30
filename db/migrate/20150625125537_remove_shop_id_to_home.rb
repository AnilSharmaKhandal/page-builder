class RemoveShopIdToHome < ActiveRecord::Migration
  def change
    remove_column :homes, :shop_id, :integer
  end
end
