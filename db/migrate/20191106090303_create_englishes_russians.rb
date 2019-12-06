# frozen_string_literal: true

class CreateEnglishesRussians < ActiveRecord::Migration[6.0]
  def change
    create_table :englishes_russians, id: false do |t|
      t.integer :russian_id
      t.integer :english_id
    end
  end
end
