module Collector
  extend ActiveSupport::Concern

  included do
    has_many :user_cards
    has_many :cards, through: :user_cards
  end
end