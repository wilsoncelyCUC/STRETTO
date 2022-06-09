class ChangeTypeToPost < ActiveRecord::Migration[6.1]
  def change
    change_table :posts do |t|
      t.rename :type, :type_post

    end
  end
end
