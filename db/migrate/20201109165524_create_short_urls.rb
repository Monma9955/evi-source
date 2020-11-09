class CreateShortUrls < ActiveRecord::Migration[5.2]
  def change
    create_table :short_urls do |t|
      t.reference :evidence
      t.string :url

      t.timestamps
    end
  end
end
