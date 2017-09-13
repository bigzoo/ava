class CreateSessions < ActiveRecord::Migration[5.1]
  def change
    create_table :sessions do |t|
      t.string :token
      t.integer :user_id

      t.timestamps
    end
  end
end
