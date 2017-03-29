# frozen_string_literal: true

class Couchpost < ApplicationRecord
  belongs_to :profile

  validates :location, presence: true
  validates :date_needed, presence: true
  validates :profile, presence: true
end
