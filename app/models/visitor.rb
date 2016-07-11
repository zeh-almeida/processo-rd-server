# == Schema Information
#
# Table name: visitors
#
#  id         :uuid             not null, primary key
#  email      :citext           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Visitor < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  has_many :visitations, dependent: :destroy

  scope :by_email, -> email { where('visitors.email ILIKE ?', "%#{ email }%" ) }

  accepts_nested_attributes_for :visitations, reject_if: :all_blank
end
