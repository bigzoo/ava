class AddNameToSession < ActiveRecord::Migration[5.1]
  def change
    add_column :sessions, :name, :string
  end
end
