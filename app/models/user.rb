require 'digest/sha1'

class User < ActiveRecord::Base

  validates_presence_of :username
  validates_presence_of :is_admin

  def login(password)
    target = User.find_by_username(self.username)
    if(target && target.password_hash == User.pw_hash(password))
      target
    end
  end

  def self.pw_hash(password)
    Digest::SHA1.hexdigest(password)
  end

end
