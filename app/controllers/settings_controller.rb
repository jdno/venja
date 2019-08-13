# frozen_string_literal: true

class SettingsController < ApplicationController
  before_action :set_settings, only: %i[edit update]

  def edit
  end

  def update
    if @settings.update(settings_params)
      flash[:success] = "Settings were successfully updated."
      redirect_to edit_settings_url
    else
      render :edit
    end
  end

  private

  def set_settings
    @settings = authorize current_user.settings
  end

  def settings_params
    params.require(:settings).permit(:time_zone)
  end
end
