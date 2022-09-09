# frozen_string_literal: true

class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.text :status
      t.references :recipient
      t.references :sender
      t.timestamps
    end
    add_index :requests, %i[recipient_id sender_id], unique: true
  end
end
