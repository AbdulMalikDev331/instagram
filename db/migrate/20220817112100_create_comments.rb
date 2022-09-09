# frozen_string_literal: true

class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.references :user
      t.references :post
      t.string :comment, null: false
      t.timestamps
    end
    add_index :comments, %i[user_id post_id]
  end
end
