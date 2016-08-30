class CreateDinnerDishes < ActiveRecord::Migration[5.0]
  def change
    create_table :dinner_dishes do |t|
      t.integer :dish_id
      t.integer :dinner_id
      t.string :course
    end
  end
end
