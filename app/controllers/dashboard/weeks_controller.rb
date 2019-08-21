# frozen_string_literal: true

module Dashboard
  class WeeksController < ApplicationController
    def index
      @query = WeeklyActivitiesQuery.new(policy_scope(Habit))
    end
  end
end
