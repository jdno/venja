# frozen_string_literal: true

require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "valid from the fixture" do
    assert users(:user).valid?
  end

  test "invalid without an email" do
    user = users :user

    user.email = ""

    assert_not user.valid?
  end

  test "generates a uuid for new records" do
    user = User.create!(email: "new@example.com", password: "password")

    assert user.reload.uuid
  end

  test "saves email in lower case" do
    user = users :user

    user.update email: "TEST@EXAMPLE.COM"

    assert_equal "test@example.com", user.reload.email
  end
end
