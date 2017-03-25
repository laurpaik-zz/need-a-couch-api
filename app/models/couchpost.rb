# frozen_string_literal: true

class Couchpost < ApplicationRecord
  belongs_to :profile

  validates :location, presence: true
end
