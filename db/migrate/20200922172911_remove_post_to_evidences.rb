class RemovePostToEvidences < ActiveRecord::Migration[5.2]
  def change
    remove_column :evidences, :post, :bigint
  end
end
