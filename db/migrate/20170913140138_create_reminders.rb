class CreateReminders < ActiveRecord::Migration[5.1]
  def change
    create_table :reminders do |t|
      t.time :time
      t.date :date
      t.string :recurrence
      t.string :name
      t.integer :user_id
      t.string :session_token

      t.timestamps
    end
  end
end
