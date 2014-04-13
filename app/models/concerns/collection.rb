module Collection
  extend ActiveSupport::Concern

  included do
    has_many :cards, dependent: :delete_all, after_add: :increase_number
    accepts_nested_attributes_for :cards
  end

  def increase_number(card)
    unless card.number.present?
      card.update_attributes(number: cards.size)
    end
  end
end