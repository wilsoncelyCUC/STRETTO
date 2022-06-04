class CreateInvitations < ActiveRecord::Migration[6.1]
  def change
    create_table :invitations do |t|
      t.string :status
      t.references :musician, null: false, foreign_key: true
      t.references :orchestra, null: false, foreign_key: true

      t.timestamps
    end
  end
end
