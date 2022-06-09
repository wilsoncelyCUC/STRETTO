class Post < ApplicationRecord
  belongs_to :orchestra
  POST_TYPE = ["One time", "Recurrent"]
end
