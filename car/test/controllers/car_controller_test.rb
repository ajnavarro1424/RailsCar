require 'test_helper'

class CarControllerTest < ActionController::TestCase
  test "should get homepage" do
    get :homepage
    assert_response :success
  end

  test "should get simulate" do
    get :simulate
    assert_response :success
  end

  test "should get status" do
    get :status
    assert_response :success
  end

end
