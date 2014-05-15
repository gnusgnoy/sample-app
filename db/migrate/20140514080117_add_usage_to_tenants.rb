class AddUsageToTenants < ActiveRecord::Migration
  def change
    add_column :tenants, :usage, :string
  end
end
