class Post < ApplicationRecord
  has_many :evidences, dependent: :destroy

  accepts_nested_attributes_for :evidences, allow_destroy: true

  validates :text, presence: true
end
