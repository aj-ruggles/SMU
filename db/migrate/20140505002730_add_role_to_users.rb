class AddRoleToUsers < ActiveRecord::Migration
  def change
    add_column :users, :organization_id, :integer
    add_column :users, :group_id, :integer
    add_column :users, :role, :string
  end
end
