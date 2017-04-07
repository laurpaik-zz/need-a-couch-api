# frozen_string_literal: true

class Profile < ApplicationRecord
  has_many :couchposts
  has_many :friendships
  has_many :friends, through: :friendships
  has_many :inverse_friendships, class_name: 'Friendship',
                                 foreign_key: 'friend_id'
  has_many :inverse_friends, through: :inverse_friendships, source: :profile
  belongs_to :user
end
