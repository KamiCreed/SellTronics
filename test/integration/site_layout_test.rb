require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

  test "layout links" do
    get root_path
    assert_template 'welcome/index'
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", signup_path

    get signup_path
    assert_select "title", full_title("Signup")
  end
end
