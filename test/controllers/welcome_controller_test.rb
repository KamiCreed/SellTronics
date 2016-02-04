require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_select "title", "Welcome | SellTronics"
  end

  test "should get about" do
    get :about
    assert_response :success
    assert_select "title", "About | SellTronics"
  end
end
