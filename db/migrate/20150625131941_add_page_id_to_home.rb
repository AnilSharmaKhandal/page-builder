class AddPageIdToHome < ActiveRecord::Migration
  def change
    add_column :homes, :page_id, :integer
  end
end
