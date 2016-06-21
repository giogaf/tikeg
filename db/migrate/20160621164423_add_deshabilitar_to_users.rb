class AddDeshabilitarToUsers < ActiveRecord::Migration
  def change
    add_column :users, :deshabilitado, :timestamp
  end
end
