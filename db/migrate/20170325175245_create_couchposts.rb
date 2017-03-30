# frozen_string_literal: true

class CreateCouchposts < ActiveRecord::Migration[5.0]
  def change
    create_table :couchposts do |t|
      t.string :location, null: false
      t.datetime :date_needed, null: false
      t.boolean :couch_found, default: false

      t.timestamps
    end
  end
end
