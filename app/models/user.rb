# frozen_string_literal: true
class User < ApplicationRecord
  include Authentication
  has_one :profile
  has_many :couchposts, through: :profile
end
