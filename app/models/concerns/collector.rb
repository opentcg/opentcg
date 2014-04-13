module Collector
  extend ActiveSupport::Concern

  included do
    has_many :user_cards, after_add: :card_added, dependent: :delete_all
    has_many :cards, through: :user_cards
    has_many :cardset_masters, after_add: :remove_cards_once, dependent: :delete_all
  end

private

  def card_added(user_card)
    check_master(user_card.card.cardset)
  end

  def check_master(cardset)
    if new_master?(cardset) and cardset_masters.where(cardset: cardset).empty?
      cardset_masters.build(cardset: cardset)
    end
  end

  def remove_cards_once(cardset_master)
    cardset = cardset_master.cardset
    cardset.cards.each do |card|
      user_card = user_cards.where(card_id: card.id).first
      user_cards.delete(user_card) if user_card.present?
    end
  end

  def new_master?(cardset)
    cards.where(cardset_id: cardset.id).distinct.size == cardset.cards.size
  end
end