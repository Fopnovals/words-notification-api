# frozen_string_literal: true

class ChangeUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :devices_ids, :string, array: true, default: []
  end
end
