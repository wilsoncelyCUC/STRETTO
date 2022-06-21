class ChangeStatusToInvitation < ActiveRecord::Migration[6.1]
  def change
    remove_column(:invitations, :status, if_exists: true)
    add_column :invitations, :status, :integer, default: 0
  end
end
