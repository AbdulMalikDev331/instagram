# frozen_string_literal: true

class CreateStories < ActiveRecord::Migration[5.2]
  def change
    create_table :stories do |t|
      t.string :description
      t.references :user
      t.timestamps
    end
  end
end
