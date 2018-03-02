class LinkTag < ActiveRecord::Base
  validates_presence_of :link_id, :tag_id
  
  belongs_to :link
  belongs_to :tag
end