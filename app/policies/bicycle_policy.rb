class BicyclePolicy < ApplicationPolicy
  def index?
    true
  end

  def new?
    true
  end

  def create?
    user.present?
  end

  def edit?
    owner? || user.admin?
  end

  def update?
    owner? || user.admin?
  end

  def destroy?
    owner?
  end

private

  def owner?
    user.id == record.user_id
  end
end