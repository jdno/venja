# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Clearance::Controller

  around_action :with_time_zone, if: :current_user

  private

  def with_time_zone(&block)
    Time.use_zone(current_user.settings.time_zone, &block)
  end
end
