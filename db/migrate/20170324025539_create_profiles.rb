# frozen_string_literal: true

class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.string :given_name, null: false
      t.string :surname, null: false
      t.string :gender, null: false
      t.date :dob, null: false

      t.timestamps null: false
    end
  end
end
