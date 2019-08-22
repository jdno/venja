# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Clearance::Controller
  include Pundit

  before_action :require_login
  around_action :with_time_zone, if: :current_user

  # Raise errors during development when controllers actions miss authorization
  # rubocop:disable Rails/LexicallyScopedActionFilter
  after_action :verify_authorized, except: :index
  after_action :verify_policy_scoped, only: :index
  # rubocop:enable Rails/LexicallyScopedActionFilter

  add_flash_types :error, :success

  private

  def with_time_zone(&block)
    Time.use_zone(current_user.settings.time_zone, &block)
  end
end
