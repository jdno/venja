# frozen_string_literal: true

require "test_helper"
require "clearance_helper"

SimpleCov.command_name "test:system"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium, using: :headless_firefox, screen_size: [1400, 1400]

  include ClearanceHelper
end
