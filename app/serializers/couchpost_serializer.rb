# frozen_string_literal: true

class CouchpostSerializer < ActiveModel::Serializer
  attributes :id, :location, :date_needed
end
