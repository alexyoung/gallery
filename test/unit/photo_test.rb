require File.dirname(__FILE__) + '/../test_helper'

class PhotoTest < ActiveSupport::TestCase
  fixtures :photos
  
  def test_titles_are_required_on_create
    assert Photo.create.errors.on(:title)
  end
  
  def test_titles_are_required_on_update
    photo = photos(:one)
    photo.title = nil
    photo.save
    assert photo.errors.on(:title)
  end
  
  def test_titles_are_not_required_for_thumbnails
    assert photos(:thumbnail).valid?
  end
end
