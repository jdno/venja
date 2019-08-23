# frozen_string_literal: true

class ActivitiesController < ApplicationController
  before_action :set_habit
  before_action :set_activity, only: :destroy

  # TODO: Fix style violation
  # rubocop:disable Metrics/AbcSize
  def create
    @activity = authorize Activity.new(activity_params.merge(habit: @habit))

    respond_to do |format|
      if @activity.save
        format.html { redirect_to track_url, success: t(".success") }
        format.json { render_activity @activity.reload, @habit }
      else
        format.html { redirect_to track_url, error: t(".failure") }
        format.json { render_activity @activity, @habit }
      end
    end
  end
  # rubocop:enable Metrics/AbcSize

  def destroy
    @activity.destroy
    respond_to do |format|
      format.html { redirect_to track_url }
      format.json { render_activity @activity, @habit }
    end
  end

  private

  def set_habit
    @habit = authorize Habit.find_by!(uuid: params[:habit_uuid])
  end

  def set_activity
    @activity = authorize Activity.find_by!(uuid: params[:uuid])
  end

  def activity_params
    params.require(:activity).permit(:performed_at)
  end

  def render_activity(activity, habit)
    render partial: "dashboard/weeks/activity",
           locals: {
             activity: activity,
             habit: habit,
             date: activity.performed_at
           },
           formats: [:html]
  end
end
