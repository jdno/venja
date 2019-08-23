# frozen_string_literal: true

class WeeklyActivitiesQuery
  attr_reader :relation

  def initialize(relation)
    @relation = relation
  end

  def start_date
    @start_date ||= Time.zone.now.to_date.beginning_of_week
  end

  def end_date
    @end_date ||= start_date.end_of_week
  end

  def all
    relation
      .includes(:activities)
      .order("habits.name ASC")
      .where(activities: { performed_at: [nil, start_date..end_date] })
  end
end
