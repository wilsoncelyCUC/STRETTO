class ChangetypetoOrchestra < ActiveRecord::Migration[6.1]
  def change
    change_table :orchestras do |t|
      t.rename :type, :type_orchestra
    end
  end
end
