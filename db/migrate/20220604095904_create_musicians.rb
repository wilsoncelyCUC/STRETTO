class CreateMusicians < ActiveRecord::Migration[6.1]
  def change
    create_table :musicians do |t|
      t.string :first_name
      t.string :last_name
      t.date :birthday
      t.string :level
      t.string :instrument
      t.string :style
      t.string :photo
      t.string :bio
      t.number_field :zip_code
      t.references :user

      t.timestamps
    end
  end
end
