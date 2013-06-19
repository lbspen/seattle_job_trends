class CreateSnapshots < ActiveRecord::Migration
  def change
    create_table :snapshots do |t|
      t.string :location

      t.timestamps
    end
  end
end
