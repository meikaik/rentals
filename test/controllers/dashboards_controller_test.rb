require 'test_helper'

class DashboardsControllerTest < ActionController::TestCase

  test "should get hello" do
    get :hello
    assert_response :success
  end

  test "should get hi" do
    get :hi
    assert_response :success
  end

  test "should get personalized message" do
    get :personalized, params: { name: "Reeba" }
    assert_response :success
    assert_select 'body #message', 'Hello, Reeba'
  end

  test "should get reverse-personalized message" do
    get :reversed, params: { name: "Reeba" }
    assert_response :success
    assert_select 'body #message', 'Hello, abeeR'
  end

end