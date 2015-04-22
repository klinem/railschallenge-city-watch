class CreateResponders < ActiveRecord::Migration
  def change
    create_table :responders do |t|
      t.string :type
      t.string :name
      t.integer :capicity
      t.boolean :on_duty

      t.timestamps null: false
    end
  end
end
