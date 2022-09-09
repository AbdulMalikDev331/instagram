# frozen_string_literal: true

class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.references :user
      t.references :post
      t.timestamps
    end
    add_index :likes, %i[user_id post_id], unique: true
  end
end
