class CreateCardsets < ActiveRecord::Migration
  def change
    create_table :cardsets do |t|
      t.string :identifier

      t.timestamps
    end
    add_index :cardsets, :identifier, :unique => true
  end
end
