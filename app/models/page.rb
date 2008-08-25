class Page < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :site_id
  
  belongs_to :site
  has_many :comments, :order => 'created_at desc'
end
