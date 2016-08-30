class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.integer :imageable_id
      t.string  :url
    end
  end
end
