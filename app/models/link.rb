require "pg_search"
include PgSearch

class Link < ActiveRecord::Base
  validates_presence_of :description, :link

  has_many :link_tags
  has_many :tags, through: :link_tags
  belongs_to :company

  #include PgSearch
  pg_search_scope :search, :against => [:description, :link]
end