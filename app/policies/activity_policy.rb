# frozen_string_literal: true

class ActivityPolicy < ApplicationPolicy
  def create?
    user.present?
  end

  def destroy?
    record.user.id == user.id
  end

  class Scope < Scope
    def resolve
      scope.joins(:habit).where(habits: { user: user })
    end
  end
end
