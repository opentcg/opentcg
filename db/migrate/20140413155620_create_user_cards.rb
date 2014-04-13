class CreateUserCards < ActiveRecord::Migration
  def change
    create_table :user_cards do |t|
      t.integer :card_id
      t.integer :user_id

      t.timestamps
    end
    add_index :user_cards, :card_id
    add_index :user_cards, :user_id
  end
end
