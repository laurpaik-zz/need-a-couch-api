# frozen_string_literal: true

class Profile < ApplicationRecord
  validates :given_name, presence: true
  validates :surname, presence: true
  validates :gender, presence: true
  validates :dob, presence: true
end
