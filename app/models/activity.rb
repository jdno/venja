# frozen_string_literal: true

class Activity < ApplicationRecord
  belongs_to :habit
  has_one :user, through: :habit

  validates :performed_at, presence: true, uniqueness: { scope: :habit }

  def to_param
    uuid
  end
end
