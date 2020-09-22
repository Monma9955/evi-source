class ChangeDatatypeTextOfPosts < ActiveRecord::Migration[5.2]
  def change
    change_column :posts, :text, :text
  end
end
