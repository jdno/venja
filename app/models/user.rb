# frozen_string_literal: true

class User < ApplicationRecord
  include Clearance::User

  has_one :settings, dependent: :destroy

  validates :email, presence: true, uniqueness: true

  before_create { build_settings }
  before_validation { email.downcase! }
end
