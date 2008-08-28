require 'test_helper'

class SiteTest < ActiveSupport::TestCase
  def test_name_required
    site = Site.new
    assert !site.valid?
    assert_not_nil site.errors.on(:name)
    site.name = 'test'
    assert site.valid?
  end
  
  def test_ordered_comments
    site = sites(:nentir_vale)
    
    assert_equal(3, site.comments.newest_first.size)
    assert_equal(comments(:kisu), site.comments.newest_first.first)
    assert_equal(comments(:steve), site.comments.newest_first.last)
  end
end
