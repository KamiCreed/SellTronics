require 'test_helper'

class PersonTest < ActiveSupport::TestCase

  def setup
    @person = Person.new(
      name: "Example Person",
      email: "person@example.com",
      weight: "100",
      height: "100",
      colour: "Red",
      password: "foobar",
      password_confirmation: "foobar"
    )
  end

  test "should be valid" do
    assert @person.valid?
  end

  test "name should be present" do
    @person.name = "     "
    assert_not @person.valid?
  end

  test "email should be present" do
    @person.email = "    "
    assert_not @person.valid?
  end

  test "name should not be too long" do
    @person.name = "a" * 51
    assert_not @person.valid?
  end

  test "email should not be too long" do
    @person.email = "a" * 244 + "@example.com"
    assert_not @person.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @person.email = valid_address
      assert @person.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @person.email = invalid_address
      assert_not @person.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "email addresses should be unique" do
    duplicate_person = @person.dup
    duplicate_person.email = @person.email.upcase
    @person.save
    assert_not duplicate_person.valid?
  end

  test "password should be present" do
    @person.password = @person.password_confirmation = " " * 6
    assert_not @person.valid?
  end

  test "password should have a minimum length" do
    @person.password = @person.password_confirmation = "a" * 5
    assert_not @person.valid?
  end
end
