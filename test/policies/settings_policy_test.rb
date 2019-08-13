# frozen_string_literal: true

require "test_helper"

class SettingsPolicyTest < ActiveSupport::TestCase
  setup do
    @user = users :user
    @settings = @user.settings
  end

  test "scope returns the settings belonging to the user" do
    assert_equal [@settings], SettingsPolicy::Scope.new(@user, Settings).resolve
  end

  test "update? returns true for the owner" do
    assert_nothing_raised do
      Pundit.authorize @user, @settings, :update?
    end
  end

  test "update? returns false for other users" do
    assert_raises Pundit::NotAuthorizedError do
      Pundit.authorize nil, @settings, :update?
    end
  end
end
