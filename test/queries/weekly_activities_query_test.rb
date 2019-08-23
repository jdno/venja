# frozen_string_literal: true

require "test_helper"

class WeeklyActivitiesQueryTest < ActiveSupport::TestCase
  setup do
    @user = users :user
  end

  test "without params returns habits in the current week" do
    habits = WeeklyActivitiesQuery.new(Habit.where(user: @user)).all
    assert_equal [habits(:journal), habits(:meditate), habits(:sleep)], habits
  end

  test "without params includes activities in the current week" do
    query = WeeklyActivitiesQuery.new(Habit.where(name: "Journal"))

    start_date = Time.zone.now.to_date.beginning_of_week
    end_date = start_date.end_of_week
    weekly_activities = Activity.where(
      habit: habits(:journal),
      performed_at: start_date..end_date
    )

    assert_equal weekly_activities, query.all.first.activities
  end
end
