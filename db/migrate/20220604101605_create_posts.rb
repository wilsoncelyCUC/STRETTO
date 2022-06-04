class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :instrument
      t.text :description
      t.string :level
      t.string :periodicity
      t.date :date
      t.string :type
      t.string :style
      t.references :orchestra, null: false, foreign_key: true

      t.timestamps
    end
  end
end
