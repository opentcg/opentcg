class Cardset < ActiveRecord::Base
  include Collection
  has_attached_file :master_card
  validates_attachment :master_card, content_type: { content_type: ["image/gif", "image/png"] }, size: { :in => 0..10.kilobytes }
end
