require 'test_helper'

class SiteTest < ActiveSupport::TestCase
  def test_name_required
    site = Site.new
    assert !site.valid?
    assert_not_nil site.errors.on(:name)
    site.name = 'test'
    assert site.valid?
  end
end
