class AddUsageWaters < ActiveRecord::Migration
  def change
    add_column :waters, :usage, :string
  end
end
