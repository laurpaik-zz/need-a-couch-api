# frozen_string_literal: true

class CouchpostSerializer < ActiveModel::Serializer
  attributes :id, :location, :date_needed, :couch_found

  has_one :profile

  def profiles
    object.profiles.pluck(:id)
  end
end
