class AddColumnToReservation < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :column, :integer
  end
end
