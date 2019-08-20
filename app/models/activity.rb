# frozen_string_literal: true

class Activity < ApplicationRecord
  belongs_to :habit

  validates :performed_at, presence: true

  def to_param
    uuid
  end
end
