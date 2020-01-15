# frozen_string_literal: true

class CreateCollectionsRussians < ActiveRecord::Migration[6.0]
  def change
    create_table :collections_russians, id: false do |t|
      t.integer :russian_id
      t.integer :collection_id
    end
  end
end
