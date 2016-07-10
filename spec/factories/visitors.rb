# == Schema Information
#
# Table name: visitors
#
#  id         :uuid             not null, primary key
#  email      :citext           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :visitor do
    email { FFaker::Internet.email }
  end
end
