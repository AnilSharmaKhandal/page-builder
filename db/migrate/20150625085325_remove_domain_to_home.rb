class RemoveDomainToHome < ActiveRecord::Migration
  def change
    remove_column :homes, :domain, :string
  end
end
