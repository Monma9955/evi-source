class AddPostIdToEvidences < ActiveRecord::Migration[5.2]
  def change
    add_reference :evidences, :post, null: false, foreign_key: true
  end
end
