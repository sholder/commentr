class Comment < ActiveRecord::Base
  validates_presence_of :nickname
  validates_presence_of :text
  validates_presence_of :page
  belongs_to :page
end
