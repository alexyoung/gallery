require File.dirname(__FILE__) + '/../test_helper'

class CommentsControllerTest < ActionController::TestCase
  def test_should_create_comment
    login_as :quentin
    assert_difference('Comment.count') do
      post :create, :comment => { :title => 'Example', :body => 'Example 2' }, :photo_id => photos(:one).id
      assert_valid assigns(:comment)
      assert_kind_of Photo, assigns(:comment).photo
    end

    assert_redirected_to photo_url(assigns(:photo))
  end
end
