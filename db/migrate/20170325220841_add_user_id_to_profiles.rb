# frozen_string_literal: true

class AddUserIdToProfiles < ActiveRecord::Migration[5.0]
  def change
    add_reference :profiles, :user, index: true, foreign_key: true, null: false
  end
end
