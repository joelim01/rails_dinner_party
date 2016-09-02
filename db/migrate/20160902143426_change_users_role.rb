class ChangeUsersRole < ActiveRecord::Migration[5.0]
  def change
    change_table :users do |t|
      t.rename :role, :admin
    end
    change_column :users, :admin, :boolean
    change_column_default :users, :admin, false
  end
end
