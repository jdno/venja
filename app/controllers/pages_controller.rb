# frozen_string_literal: true

class PagesController < ApplicationController
  include HighVoltage::StaticPage

  skip_before_action :require_login
  skip_after_action :verify_authorized
end
