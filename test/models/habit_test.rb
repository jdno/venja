# frozen_string_literal: true

require "test_helper"

class HabitTest < ActiveSupport::TestCase
  setup do
    @habit = habits :sleep
  end

  test "valid from the fixture" do
    assert @habit.valid?
  end

  test "invalid without a name" do
    @habit.name = ""
    assert_not @habit.valid?
  end

  test "invalid with a name taken by the user" do
    @habit.name = habits(:journal).name
    assert_not @habit.valid?
  end

  test "valid with a name taken by another user" do
    @habit.name = habits(:cook).name
    assert @habit.valid?
  end

  test "generates a uuid for new habits" do
    habit = Habit.create!(user: users(:user), name: "HabitTest")
    assert habit.reload.uuid
  end
end
