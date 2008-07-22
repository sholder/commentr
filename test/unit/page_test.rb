require 'test_helper'

class PageTest < ActiveSupport::TestCase
  def test_name_required
    p = Page.new
    assert !p.valid?
    assert_not_nil p.errors.on(:name)
    p.name = 'test'
    p.valid?
    assert_nil p.errors.on(:name)
  end
  
  def test_site_required
    p = Page.new
    assert !p.valid?
    assert_not_nil p.errors.on(:site)
    p.site = Site.new
    p.valid?
    assert_nil p.errors.on(:site)
  end
end
