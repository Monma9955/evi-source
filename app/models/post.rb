class Post < ApplicationRecord
  has_many :evidences, dependent: :destroy
end
