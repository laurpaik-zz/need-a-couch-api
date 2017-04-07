# frozen_string_literal: true

class CreateFriendships < ActiveRecord::Migration[5.0]
  def change
    create_table :friendships do |t|
      t.integer :profile_id, index: true, foreign_key: true, null: false
      t.integer :friend_id, index: true, foreign_key: true, null: false

      t.timestamps
    end
  end
end
