class AddUserIdCarIdStartDateEndDatePriceStatusToBookings < ActiveRecord::Migration[5.2]
  def change
    add_reference :bookings, :user, index: true
    add_reference :bookings, :car, index: true
    add_column :bookings, :start_date, :date
    add_column :bookings, :end_date, :date
    add_column :bookings, :price, :integer
    add_column :bookings, :status, :string
  end
end
