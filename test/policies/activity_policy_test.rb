# frozen_string_literal: true

require "test_helper"

class ActivityPolicyTest < ActiveSupport::TestCase
  setup do
    @user = users(:user)
    @activity = activities(:sleep)
  end

  test "scope returns activities belonging to the user" do
    assert_equal(
      Activity.joins(:habit).where(habits: { user: @user }),
      ActivityPolicy::Scope.new(@user, Activity).resolve
    )
  end

  test "create? returns true for signed in users" do
    assert_nothing_raised do
      Pundit.authorize @user, Activity, :create?
    end
  end

  test "create? returns false for visitors" do
    assert_raises Pundit::NotAuthorizedError do
      Pundit.authorize nil, Activity, :create?
    end
  end

  test "destroy? returns true for the activity's user" do
    assert_nothing_raised do
      Pundit.authorize @user, @activity, :destroy?
    end
  end

  test "destroy? returns false for other users" do
    assert_raises Pundit::NotAuthorizedError do
      Pundit.authorize users(:someone), @activity, :destroy?
    end
  end
end
