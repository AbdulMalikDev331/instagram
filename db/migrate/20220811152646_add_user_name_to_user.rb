# frozen_string_literal: true

class AddUserNameToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :username, :string
    add_column :users, :fullname, :string
  end
end
