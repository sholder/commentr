class Site < ActiveRecord::Base
  validates_presence_of :name
  
  has_many :pages
  has_many :comments, :through => :pages do
    def newest_first
      find :all, :order => 'comments.created_at desc'
    end
  end
  
end
