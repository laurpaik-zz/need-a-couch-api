# frozen_string_literal: true

class Profile < ApplicationRecord
  has_many :couchposts
  belongs_to :user

end
