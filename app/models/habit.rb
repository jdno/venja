# frozen_string_literal: true

class Habit < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, uniqueness: { scope: :user }

  def to_param
    uuid
  end
end
