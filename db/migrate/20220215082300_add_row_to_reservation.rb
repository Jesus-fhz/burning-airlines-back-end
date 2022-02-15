class AddRowToReservation < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :row, :integer
  end
end
