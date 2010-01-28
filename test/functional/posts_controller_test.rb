require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  def teardown
    session[:admin] = false
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:posts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create post" do
    session[:admin] = true
    assert_difference('Post.count') do
      post :create, :post => { :title => 'oh', :body => 'this' }
    end

    assert_redirected_to post_path(assigns(:post))
  end

  test "should not create post" do
    assert_raise SecurityError do
      post :create, :post => { :title => 'oh', :body => 'this' }
    end
  end

  test "should show post" do
    get :show, :id => posts(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => posts(:one).to_param
    assert_response :success
  end

  test "should update post" do
    session[:admin] = true
    put :update, :id => posts(:one).to_param, :post => { }
    assert_redirected_to post_path(assigns(:post))
  end

  test "should not update post" do
    assert_raise SecurityError do
      put :update, :id => posts(:one).to_param, :post => { }
    end
  end

  test "should destroy post" do
    session[:admin] = true
    assert_difference('Post.count', -1) do
      delete :destroy, :id => posts(:one).to_param
    end

    assert_redirected_to posts_path
  end

  test "should not destroy post" do
    assert_raise SecurityError do
      delete :destroy, :id => posts(:one).to_param
    end
  end
end
