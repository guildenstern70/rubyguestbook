class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :message
      t.string :title

      t.timestamps null: false
    end
  end
end
