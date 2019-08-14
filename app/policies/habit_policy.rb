# frozen_string_literal: true

class HabitPolicy < ApplicationPolicy
  def create?
    user.present?
  end

  def update?
    user == record.user
  end

  def destroy?
    update?
  end

  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end
end
