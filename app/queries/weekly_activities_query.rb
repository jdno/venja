# frozen_string_literal: true

class WeeklyActivitiesQuery
  attr_reader :relation

  def initialize(relation, start_date: nil)
    @relation = relation
    @start_date = start_date
  end

  def start_date
    @start_date ||= Time.zone.now.to_date.beginning_of_week
  end

  def end_date
    @end_date ||= start_date.end_of_week
  end

  def habits
    relation.order("habits.name ASC")
  end

  def activities
    Activity.where(habit: habits, performed_at: start_date..end_date)
  end
end
