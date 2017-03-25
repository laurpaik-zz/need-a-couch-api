# frozen_string_literal: true

class AddProfileIdToCouchposts < ActiveRecord::Migration[5.0]
  def change
    add_reference :couchposts, :profile, index: true, foreign_key: true,
                                         null: false
  end
end
