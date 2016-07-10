# == Schema Information
#
# Table name: api_keys
#
#  id         :integer          not null, primary key
#  key        :citext           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :api_key do
  end
end
