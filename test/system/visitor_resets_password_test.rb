# frozen_string_literal: true

require "application_system_test_case"

class VisitorResetsPasswordTest < ApplicationSystemTestCase
  include ActiveJob::TestHelper

  # Reset mails after each test
  def teardown
    ActionMailer::Base.deliveries.clear
  end

  test "by navigating to the page" do
    visit sign_in_path

    click_link I18n.t("sessions.form.forgot_password")

    assert_equal new_password_path, current_path
  end

  test "with valid email" do
    perform_enqueued_jobs do
      user = user_with_reset_password

      assert_displays_change_password_message
      assert_reset_notification_send_to user
    end
  end

  test "with unknown email" do
    reset_password_for "unknown.email@example.com"

    assert_displays_change_password_message
    assert_not mail_sent?
  end

  private

  def assert_reset_notification_send_to(user)
    assert_not user.confirmation_token.blank?
    assert_mail_sent(
      user.email,
      "password",
      user.confirmation_token
    )
  end

  def assert_displays_change_password_message
    assert_text I18n.t("passwords.create.description")
  end

  def assert_mail_sent(recipient, subject, body)
    assert mail_sent?

    message = ActionMailer::Base.deliveries.any? do |email|
      email.to == [recipient] &&
        email.subject =~ /#{subject}/i &&
        email.html_part.body =~ /#{body}/ &&
        email.text_part.body =~ /#{body}/
    end

    assert message
  end

  def mail_sent?
    ActionMailer::Base.deliveries.any?
  end
end
