class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.integer :commentable_id
      t.integer :user_id
      t.text :content

    end
  end
end
