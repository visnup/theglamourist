require 'test_helper'

class IndexControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :ok
  end

  test "should get portfolio" do
    get :portfolio
    assert_response :ok
  end

  test "should get services" do
    get :services
    assert_response :ok
  end
end
