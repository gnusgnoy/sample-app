class RemoveEmsResultFromWater < ActiveRecord::Migration
  def change
    remove_column :waters, :ems_result, :string
  end
end
