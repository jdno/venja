# frozen_string_literal: true

class Activity < ApplicationRecord
  belongs_to :habit

  def to_param
    uuid
  end
end
