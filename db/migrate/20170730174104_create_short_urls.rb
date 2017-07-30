class CreateShortUrls < ActiveRecord::Migration[5.1]
  def change
    create_table :short_urls do |t|
      t.text :url
      t.string :identifier

      t.timestamps
    end
  end
end
