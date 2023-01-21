class QuotePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def create?
    true
  end

  def update?
    record.user_id == user
  end

  def destroy?
    record.user == user
  end
end
