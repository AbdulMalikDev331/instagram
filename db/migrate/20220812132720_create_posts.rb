# frozen_string_literal: true

class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :description
      t.boolean :active, default: :active
      t.references :user
      t.timestamps
    end
  end
end
