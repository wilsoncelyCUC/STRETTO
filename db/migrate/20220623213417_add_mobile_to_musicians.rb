class AddMobileToMusicians < ActiveRecord::Migration[6.1]
  def change
    add_column :musicians, :phone_number, :integer
    add_column :orchestras, :phone_number, :integer
  end
end
