class AddIndexToCardsetMasters < ActiveRecord::Migration
  def change
    add_index :cardset_masters, [:cardset_id, :user_id], unique: true
  end
end
