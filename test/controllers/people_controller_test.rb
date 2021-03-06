require 'test_helper'

class PeopleControllerTest < ActionController::TestCase
  def setup
    @person = people(:michael)
    @other_person = people(:archer)
  end

  test "should redirect index when not logged in" do
    get :index
    assert_redirected_to login_url
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should redirect edit when not logged in" do
    get :edit, id: @person
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect update when not logged in" do
    patch :update, id: @person, person: { name: @person.name, email: @person.email }
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect edit when logged in as wrong person" do
    log_in_as(@other_person)
    get :edit, id: @person
    assert flash.empty?
    assert_redirected_to root_url
  end

  test "should redirect update when logged in as wrong person" do
    log_in_as(@other_person)
    patch :update, id: @person, person: { name: @person.name, email: @person.email }
    assert flash.empty?
    assert_redirected_to root_url
  end
end
