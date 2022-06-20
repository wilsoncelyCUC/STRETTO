class ChangePhotoToMusician < ActiveRecord::Migration[6.1]
  def change
    change_table :musicians do |t|
      t.rename :photo, :url_photo
    end
  end
end
