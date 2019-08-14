# frozen_string_literal: true

require "test_helper"

class HabitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:user)
    @habit = habits(:sleep)
  end

  test "should get index" do
    get habits_url(as: @user)
    assert_response :success
  end

  test "should get new" do
    get new_habit_url(as: @user)
    assert_response :success
  end

  test "should create habit" do
    assert_difference("Habit.count") do
      post habits_url(as: @user), params: {
        habit: { name: "HabitsControllerTest" }
      }
    end

    assert_redirected_to habits_url
  end

  test "should get edit" do
    get edit_habit_url(@habit, as: @user)
    assert_response :success
  end

  test "should update habit" do
    patch habit_url(@habit, as: @user), params: {
      habit: { name: "Updated name" }
    }

    assert_redirected_to habits_url
  end

  test "should destroy habit" do
    assert_difference("Habit.count", -1) do
      delete habit_url(@habit, as: @user)
    end

    assert_redirected_to habits_url
  end
end
