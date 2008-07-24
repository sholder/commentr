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
  
  def test_belongs_to
    nv = pages(:nv_session_1)
    assert_equal sites(:nentir_vale), nv.site
  end
  
  def test_comments_ordering
    p = pages(:nv_session_1)
    assert_equal(3, p.comments.length)
    assert_equal(comments(:kisu), p.comments.first)
    assert_equal(comments(:steve), p.comments.last)
  end
end
