class AddEmsResultToWaters < ActiveRecord::Migration
  def change
    add_column :waters, :ems_result, :string
  end
end
