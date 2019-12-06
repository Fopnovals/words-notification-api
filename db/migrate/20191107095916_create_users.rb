# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.boolean :public, default: true
      t.boolean :email_verified, default: false
      t.string :role, default: 'user'
      t.string :password_digest
      t.string :photo_url

      t.timestamps
    end
  end
end
