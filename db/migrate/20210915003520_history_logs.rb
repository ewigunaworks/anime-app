class HistoryLogs < ActiveRecord::Migration[5.2]
  def up
    create_table :history_logs do |t|
      t.string :url
      t.string :method
      t.string :response_status
      t.datetime :access_at

      t.timestamps null: false
    end
  end

  def down
    drop_table :history_logs
  end
end
