# frozen_string_literal: true

class ProfileSerializer < ActiveModel::Serializer
  attributes :id, :given_name, :surname, :gender, :dob, :editable

  def editable
    scope == object.user
  end
end
