class CarPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    true
  end
  def create?
    record = user
  end
  
  def show 
    true
  end

  def mycars?
    record = user
  end

  def destroy
    record = user
  end
end
