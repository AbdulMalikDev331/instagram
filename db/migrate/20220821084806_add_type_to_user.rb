# frozen_string_literal: true

class AddTypeToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :kind, :text, default: 'public'
  end
end
