# frozen_string_literal: true

# The sessions controller extends Clearance's controller to skip the
# authorization check. Otherwise, an exception is thrown on every session page.
class SessionsController < Clearance::SessionsController
  skip_after_action :verify_authorized
end
