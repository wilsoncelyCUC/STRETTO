class Addtagtoposts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :tag_post, :string
  end
end
