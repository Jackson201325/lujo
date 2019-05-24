class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def my_bookings?
    true
  end

  def accept?
    user == record.car.user
  end

  def reject?
    user == record.car.user
  end
end
