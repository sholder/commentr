require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def test_hash
    assert_equal(users(:sholder).password_hash, User.pw_hash('sholder'))
  end
end
