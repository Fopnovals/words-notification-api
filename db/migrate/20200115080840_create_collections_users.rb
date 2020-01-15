class CreateCollectionsUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :collections_users, id: false do |t|
      t.integer :user_id
      t.integer :collection_id
    end
  end
end
