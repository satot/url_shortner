class CreateAccessLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :access_logs do |t|
      t.references :short_url, foreign_key: true
      t.string :ip
      t.text :user_agent
      t.string :uuid

      t.timestamps
    end
  end
end
