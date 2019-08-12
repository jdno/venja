# frozen_string_literal: true

module ClearanceHelper
  extend ActiveSupport::Concern

  # Assert that a user is signed in
  def assert_user_signed_in
    visit root_path
    assert_link I18n.t("layouts.application.sign_out")
  end

  # Assert that a user is signed out
  def assert_user_signed_out
    assert_text I18n.t("layouts.application.sign_in")
  end

  # Reset the password for the given email address
  def reset_password_for(email)
    visit new_password_path
    fill_in "password_email", with: email
    click_button I18n.t("helpers.submit.password.submit")
  end

  # Sign a user in
  def sign_in
    user = users :user
    sign_in_with user.email, "password"
  end

  # Sign in with the given credentials
  def sign_in_with(email, password)
    visit sign_in_path
    fill_in "session_email", with: email
    fill_in "session_password", with: password
    click_button I18n.t("helpers.submit.session.submit")
  end

  # Sign the current user out
  def sign_out
    click_link I18n.t("layouts.application.sign_out")
  end

  # Sign up with the given credentials
  def sign_up_with(email, password)
    visit sign_up_path
    fill_in "user_email", with: email
    fill_in "user_password", with: password
    click_button I18n.t("helpers.submit.user.create")
  end

  # Send password reset mail and return the user
  def user_with_reset_password
    user = users :user
    reset_password_for user.email
    user.reload
  end
end
