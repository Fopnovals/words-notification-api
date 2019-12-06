# frozen_string_literal: true

class CreateEnglishes < ActiveRecord::Migration[6.0]
  def change
    create_table :englishes do |t|
      t.string :name
      t.timestamps
    end
  end
end
