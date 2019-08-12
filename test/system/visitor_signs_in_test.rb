# frozen_string_literal: true

require "application_system_test_case"

class VisitorSignsInTest < ApplicationSystemTestCase
  test "with valid email and password" do
    create_user "sign-in-test@example.com", "password"
    sign_in_with "sign-in-test@example.com", "password"

    assert_user_signed_in
  end

  test "with valid mixed-case email and password " do
    create_user "user.name@example.com", "password"
    sign_in_with "User.Name@example.com", "password"

    assert_user_signed_in
  end

  test "tries with invalid password" do
    create_user "sign-in-test@example.com", "password"
    sign_in_with "sign-in-test@example.com", "wrong_password"

    assert_displays_sign_in_error
    assert_user_signed_out
  end

  test "tries with invalid email" do
    sign_in_with "unknown.email@example.com", "password"

    assert_displays_sign_in_error
    assert_user_signed_out
  end

  private

  def create_user(email, password)
    User.create! email: email, password: password
  end

  def assert_displays_sign_in_error
    assert_text(
      I18n.t("flashes.failure_after_create", sign_up_path: sign_up_path)
    )
  end
end
