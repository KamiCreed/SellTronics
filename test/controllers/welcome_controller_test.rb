require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase

  def setup
    @base_title = "SellTronics"
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_select "title", "#{@base_title}"
    assert_select "h1", "#{@base_title}"
  end

  test "should get about" do
    get :about
    assert_response :success
    assert_select "title", "About | #{@base_title}"
  end
end
