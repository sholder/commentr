class Page < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :site
  belongs_to :site
end
