# frozen_string_literal: true

# The UsersController extends Clearance's controller to skip the authorization
# check. Otherwise, an exception is thrown on every page that belongs to this
# controller.
class UsersController < Clearance::UsersController
  skip_after_action :verify_authorized
end
