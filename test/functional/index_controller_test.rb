require 'test_helper'

class IndexControllerTest < ActionController::TestCase
  def flickr_setup
    @controller.
      expects(:open).times(5).
        yields(mock('getTree', :read => File.read(Rails.root + 'test/fixtures/getTree.json'))).
        yields(mock('getPhotos1', :read => File.read(Rails.root + 'test/fixtures/getPhotos1.json'))).
        yields(mock('getPhotos2', :read => File.read(Rails.root + 'test/fixtures/getPhotos2.json'))).
        yields(mock('getPhotos3', :read => File.read(Rails.root + 'test/fixtures/getPhotos3.json'))).
        yields(mock('getPhotos4', :read => File.read(Rails.root + 'test/fixtures/getPhotos4.json')))
  end

  test "should get index" do
    flickr_setup
    get :index
    assert_response :ok
    assert_equal 3, assigns(:photos).size
  end

  test "should get portfolio" do
    flickr_setup
    get :portfolio
    assert_response :ok
    assert_equal 4, assigns(:sets).size
  end

  test "should get services" do
    get :services
    assert_response :ok
  end
end
