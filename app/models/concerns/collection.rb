module Collection
  extend ActiveSupport::Concern

  included do
    has_many :cards
  end
end