# == Schema Information
#
# Table name: api_keys
#
#  id         :integer          not null, primary key
#  key        :citext           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ApiKeySerializer < ActiveModel::Serializer
  attributes :id, :key
end
