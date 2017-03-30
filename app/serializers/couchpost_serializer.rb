# frozen_string_literal: true

class CouchpostSerializer < ActiveModel::Serializer
  attributes :id, :location, :date_needed, :couch_found, :profile, :editable

  def editable
    scope == object.profile.user
  end

  def profile
    object.profile.id
  end
end
