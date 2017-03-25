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

# %w(antony jeff matt jason).each do |name|
#   email = "#{name}@#{name}.com"
#   next if User.exists? email: email
#   User.create!(email: email,
#                password: 'abc123',
#                password_confirmation: nil)
# end

%w(lauren emily nayoon cara chrissy wei yen ash).each do |name|
  next if Profile.exists? given_name: name
  Profile.create!(given_name: name,
                  surname: 'kato',
                  gender: 'f',
                  dob: '1993-01-16')
end

%w(somerville brooklyn portsmouth).each do |location|
  next if Couchpost.exists? location: location
  Couchpost.create!(location: location,
                    profile: Profile.all.sample)
end
