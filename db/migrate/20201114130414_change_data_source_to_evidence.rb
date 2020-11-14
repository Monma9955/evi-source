class ChangeDataSourceToEvidence < ActiveRecord::Migration[5.2]
  def change
    change_column :evidences, :source, :text
  end
end
