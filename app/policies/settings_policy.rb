# frozen_string_literal: true

class SettingsPolicy < ApplicationPolicy
  def update?
    user == record.user
  end

  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end
end
