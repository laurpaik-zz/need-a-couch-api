# frozen_string_literal: true

class Friendship < ApplicationRecord
  belongs_to :profile
  belongs_to :friend, class_name: 'Profile'

  validates :profile, presence: true
  validates :friend, presence: true, uniqueness: { scope: :profile }
end
