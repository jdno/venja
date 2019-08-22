# frozen_string_literal: true

class ActivitiesController < ApplicationController
  before_action :set_habit
  before_action :set_activity, only: :destroy

  # TODO: Fix style violation
  # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
  def create
    @activity = authorize Activity.new(activity_params.merge(habit: @habit))

    respond_to do |format|
      if @activity.save
        format.html { redirect_to track_url, success: t(".success") }
        format.json { render json: { uuid: @activity.uuid }, status: :created }
      else
        format.html { redirect_to track_url, error: t(".failure") }
        format.json do
          render(
            json: @activity.errors,
            status: :unprocessable_entity
          )
        end
      end
    end
  end
  # rubocop:enable Metrics/AbcSize, Metrics/MethodLength

  def destroy
    @activity.destroy
    respond_to do |format|
      format.html { redirect_to track_url }
      format.json { head :no_content }
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
end
