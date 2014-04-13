class AddMasterCardToCardset < ActiveRecord::Migration
  def change
    add_attachment :cardsets, :master_card
  end
end
