class CreateWaters < ActiveRecord::Migration
  def change
    create_table :waters do |t|

      t.text :dgm
      t.text :node
      t.timestamps
    end
  end
end
