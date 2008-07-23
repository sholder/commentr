require 'test_helper'

class CommentTest < ActiveSupport::TestCase

  def setup
    @c = Comment.new
  end

  def test_nickname_required
    @c.valid?
    assert_not_nil @c.errors.on(:nickname)
    @c.nickname = 'tester'
    @c.valid?
    assert_nil @c.errors.on(:nickname) 
  end
  
  def test_text_required
    @c.valid?
    assert_not_nil @c.errors.on(:text)
    @c.text = 'blah blah blah blah blah'
    @c.valid?
    assert_nil @c.errors.on(:text)
  end
  
  def test_page_required
    @c.valid?
    assert_not_nil @c.errors.on(:page)
    @c.page = Page.new
    @c.valid?
    assert_nil @c.errors.on(:page)
  end
end
