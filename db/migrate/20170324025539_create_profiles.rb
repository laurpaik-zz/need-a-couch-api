# frozen_string_literal: true

class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.string :given_name
      t.string :surname
      t.string :gender
      t.date :dob

      t.timestamps null: false
    end
  end
end
