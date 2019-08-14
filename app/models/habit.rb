# frozen_string_literal: true

class Habit < ApplicationRecord
  belongs_to :user

  has_many :activities, dependent: :destroy

  validates :name, presence: true, uniqueness: { scope: :user }

  def to_param
    uuid
  end
end
