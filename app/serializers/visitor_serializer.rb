# == Schema Information
#
# Table name: visitors
#
#  id         :uuid             not null, primary key
#  email      :citext           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class VisitorSerializer < ActiveModel::Serializer
  attributes :id, :email, :visitations, :errors
end
