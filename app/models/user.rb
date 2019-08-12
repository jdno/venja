# frozen_string_literal: true

class User < ApplicationRecord
  include Clearance::User

  validates :email, presence: true, uniqueness: true

  before_validation { email.downcase! }
end
