# frozen_string_literal: true

class Profile < ApplicationRecord
  has_many :couchposts

  validates :given_name, presence: true
  validates :surname, presence: true
  validates :gender, presence: true
  validates :dob, presence: true
end
