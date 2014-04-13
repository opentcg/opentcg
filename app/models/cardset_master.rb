class CardsetMaster < ActiveRecord::Base
  belongs_to :user
  belongs_to :cardset
end
