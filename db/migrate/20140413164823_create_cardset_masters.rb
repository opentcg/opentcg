class CreateCardsetMasters < ActiveRecord::Migration
  def change
    create_table :cardset_masters do |t|
      t.integer :user_id
      t.integer :cardset_id

      t.timestamps
    end
  end
end
