# frozen_string_literal: true

module Dashboard
  class WeeksController < ApplicationController
    before_action :set_date

    def index
      @query = WeeklyActivitiesQuery.new(
        policy_scope(Habit),
        start_date: @start_date
      )
    end

    private

    def set_date
      date = date_from_params || Time.zone.now.to_date
      @start_date = date.beginning_of_week
    end

    def date_from_params
      return unless params.key? :date

      Time.zone.parse(params[:date])&.to_date
    rescue TypeError, ArgumentError
      nil
    end
  end
end
