class AddAdminToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :buyers, :admin, :boolean, default: false
    add_column :sellers, :admin, :boolean, default: false
  end
end
