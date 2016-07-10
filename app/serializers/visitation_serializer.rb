# == Schema Information
#
# Table name: visitations
#
#  id         :uuid             not null, primary key
#  visitor_id :integer          not null
#  address    :citext           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class VisitationSerializer < ActiveModel::Serializer
  attributes :id, :address, :visitor, :errors
end
