# frozen_string_literal: true

require "test_helper"

class HabitPolicyTest < ActiveSupport::TestCase
  setup do
    @user = users(:user)
    @habit = habits(:sleep)
  end

  test "scope returns the habits belonging to the user" do
    assert_equal(
      Habit.where(user: @user),
      HabitPolicy::Scope.new(@user, Habit).resolve
    )
  end

  test "create? returns true for signed in users" do
    assert_nothing_raised do
      Pundit.authorize @user, Habit, :create?
    end
  end

  test "create? returns false for visitors" do
    assert_raises Pundit::NotAuthorizedError do
      Pundit.authorize nil, Habit, :create?
    end
  end

  test "update? returns true for the habit's user" do
    assert_nothing_raised do
      Pundit.authorize @user, @habit, :update?
    end
  end

  test "update? returns false for other users" do
    assert_raises Pundit::NotAuthorizedError do
      Pundit.authorize users(:someone), @habit, :update?
    end
  end

  test "destroy? returns true for the habit's user" do
    assert_nothing_raised do
      Pundit.authorize @user, @habit, :destroy?
    end
  end

  test "destroy? returns false for other users" do
    assert_raises Pundit::NotAuthorizedError do
      Pundit.authorize users(:someone), @habit, :destroy?
    end
  end
end
