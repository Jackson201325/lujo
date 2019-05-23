class AddDefaultValueToAvailabilityColumn < ActiveRecord::Migration[5.2]
  def change
    change_column :cars, :availability, :boolean, default: true
  end
end
