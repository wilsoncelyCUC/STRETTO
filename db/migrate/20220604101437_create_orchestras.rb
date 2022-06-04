class CreateOrchestras < ActiveRecord::Migration[6.1]
  def change
    create_table :orchestras do |t|
      t.string :style
      t.string :type
      t.integer :size
      t.integer :zip_code
      t.string :frequency
      t.text :description
      t.string :name
      t.string :bio
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
