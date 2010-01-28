require 'test_helper'

class ContactsControllerTest < ActionController::TestCase
  test "should not get index" do
    assert_raise ActionController::UnknownAction do
      get :index
    end
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contact" do
    assert_difference('Contact.count') do
      post :create, :contact => { :name => 'jane', :email => 'jane@foo.com', :message => 'hi' }
    end

    assert_redirected_to contact_path(assigns(:contact))
  end

  test "should show contact" do
    get :show, :id => contacts(:one).to_param
    assert_response :success
    assert !@response.body.include?(contacts(:one).email)
  end

  test "should not get edit" do
    assert_raise ActionController::UnknownAction do
      get :edit, :id => contacts(:one).to_param
    end
  end

  test "should not update contact" do
    assert_raise ActionController::UnknownAction do
      put :update, :id => contacts(:one).to_param, :contact => { }
    end
  end

  test "should not destroy contact" do
    assert_raise ActionController::UnknownAction do
      delete :destroy, :id => contacts(:one).to_param
    end
  end
end
