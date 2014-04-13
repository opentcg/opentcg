module Collector
  extend ActiveSupport::Concern

  included do
    has_many :user_cards, after_add: :card_added, after_remove: :card_removed
    has_many :cards, through: :user_cards
  end


private

  def card_added(user_card)
    add_master(user_card.cardset) if new_master?(user_card.cardset)
  end

  def card_removed(user_card)

  end

  def add_master(cardset)
    
  end

  def new_master?(cardset)

  end
end