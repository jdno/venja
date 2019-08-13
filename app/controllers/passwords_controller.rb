# frozen_string_literal: true

# The passwords controller extends Clearance's controller to skip the
# authorization check. Otherwise, an exception is thrown on every page that
# belongs to this controller.
class PasswordsController < Clearance::PasswordsController
  skip_after_action :verify_authorized
end
