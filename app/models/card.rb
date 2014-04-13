class Card < ActiveRecord::Base
  belongs_to :cardset
  has_attached_file :image
  validates_attachment :image, content_type: { content_type: ["image/gif", "image/png"] }, size: { :in => 0..10.kilobytes }
end
