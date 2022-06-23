class ChangePhoneNumber < ActiveRecord::Migration[6.1]
  def change
    change_column :musicians, :phone_number, :string
    change_column :orchestras, :phone_number, :string
  end
end
