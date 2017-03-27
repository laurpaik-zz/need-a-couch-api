# frozen_string_literal: true

class CreateCouchposts < ActiveRecord::Migration[5.0]
  def change
    create_table :couchposts do |t|
      t.string :location, null: false
      t.date :date_needed, null: false
      t.string :couch_found, null: false

      t.timestamps
    end
  end
end
