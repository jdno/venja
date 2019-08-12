# frozen_string_literal: true

require "application_system_test_case"

class VisitorSignsUpTest < ApplicationSystemTestCase
  include ActiveJob::TestHelper

  # Reset mails after each test
  def teardown
    ActionMailer::Base.deliveries.clear
  end

  test "by navigating to the page" do
    visit sign_in_path

    click_link I18n.t("sessions.form.sign_up")

    assert_equal sign_up_path, current_path
  end

  test "with valid email and password" do
    sign_up_with "valid@example.com", "password"

    assert_user_signed_in
  end

  test "tries with invalid email" do
    sign_up_with "invalid_email", "password"

    assert_user_signed_out
  end

  test "tries with blank password" do
    sign_up_with "valid@example.com", ""

    assert_user_signed_out
  end
end
