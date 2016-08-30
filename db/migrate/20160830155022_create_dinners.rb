class CreateDinners < ActiveRecord::Migration[5.0]
  def change
    create_table :dinners do |t|
      t.datetime :date
      t.string :chefs
      t.timestamps
    end
  end
end
