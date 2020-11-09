class CreateShortUrls < ActiveRecord::Migration[5.2]
  def change
    create_table :short_urls do |t|
      t.references :evidence, null: false, foreign_key: true
      t.string :url, null: false

      t.timestamps
    end
  end
end
