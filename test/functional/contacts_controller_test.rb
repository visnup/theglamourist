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
    ActiveResource::HttpMock.respond_to do |mock|
      mock.get '/people/search.xml?criteria[email]=jane%40foo.com', {"Authorization"=>"Basic MTg2MTU1ZDg1Mjc2YTMwNjg2YWRiZjRjODM0NzVjZjA6WA==", "Accept"=>"application/xml"}, '<people type="array"><person><id>2</id></person></people>'
      mock.post '/emails.xml?person_id=2', {"Authorization"=>"Basic MTg2MTU1ZDg1Mjc2YTMwNjg2YWRiZjRjODM0NzVjZjA6WA==", "Content-Type"=>"application/xml"}, ''
    end

    assert_difference('Contact.count') do
      post :create, :contact => { :name => 'jane', :email => 'jane@foo.com', :phone_number => '415-305-7168', :event_at => 1.day.from_now, :message => "hi,\n\n<3 you gf!\n" }
    end

    assert_redirected_to contact_path(assigns(:contact))
    assert m = Notifier.deliveries.first
    assert_equal ['jane@theglamourist.com'], m.to
    File.open(Rails.root + 'tmp/new_contact.html', 'w') { |f| f.write m.body.raw_source }
    assert_equal File.read(fixture_path + 'new_contact.html'), m.body.raw_source
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
