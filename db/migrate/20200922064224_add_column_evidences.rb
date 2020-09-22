class AddColumnEvidences < ActiveRecord::Migration[5.2]
  def change
    add_column :evidences, :post, :bigint, null: false, foreign_key: true, index: true
    add_column :evidences, :source, :string, null: false
    add_column :evidences, :informant, :string
    add_column :evidences, :source_updated_on, :date
    add_column :evidences, :level, :integer, default: nil, limit: 1
    add_column :evidences, :fact_or_opinion, :integer, default: nil, limit: 1
    add_column :evidences, :data_type, :integer, default: nil, limit: 1
    add_column :evidences, :reference, :text
  end
end
