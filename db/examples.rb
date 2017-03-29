# frozen_string_literal: true
# This file should contain all the record creation needed to experiment with
# your app during development.
#
# The data can then be loaded with the rake db:examples (or created alongside
# the db with db:nuke_pave).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.transaction do
  %w(Lauren Emily Nayoon Cara Chrissy Wei Yen Ash).each do |name|
    email = "#{name}@#{name}.com"
    next if User.exists? email: email
    User.create(email: email,
                password: 'abc123',
                password_confirmation: 'abc123')
  end
end

Profile.transaction do
  %w(Lauren Emily Nayoon Cara Chrissy Wei Yen Ash).each do |name|
    email = "#{name}@#{name}.com"
    user = User.where(email: email).first
    profile_params = {
      user_id: user.id,
      given_name: name,
      surname: 'Kato',
      gender: 'f',
      dob: '1993-01-16'
    }
    next if Profile.exists? profile_params
    Profile.create! profile_params
  end
end

Couchpost.transaction do
  require 'date'
  date_time = DateTime.now
  %w(Somerville Brooklyn Portsmouth).each do |location|
    next if Couchpost.exists? location: location
    Couchpost.create!(location: location,
                      date_needed: date_time,
                      couch_found: false,
                      profile: Profile.all.sample)
  end
end
