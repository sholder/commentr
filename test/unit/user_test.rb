require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def test_hash
    assert_equal(users(:sholder).password_hash, User.hash('sholder'))
  end
end
