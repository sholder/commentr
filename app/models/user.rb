require 'digest/sha1'

class User < ActiveRecord::Base

  def self.hash(password)
    Digest::SHA1.hexdigest(password)
  end

end
