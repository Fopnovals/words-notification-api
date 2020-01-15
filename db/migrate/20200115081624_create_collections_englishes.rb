# frozen_string_literal: true

class CreateCollectionsEnglishes < ActiveRecord::Migration[6.0]
  def change
    create_table :collections_englishes, id: false do |t|
      t.integer :english_id
      t.integer :collection_id
    end
  end
end
