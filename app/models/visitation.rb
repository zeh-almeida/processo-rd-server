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

class Visitation < ActiveRecord::Base
  validates :address, presence: true
  validates :time,    presence: true

  belongs_to :visitor, touch: true

  scope :by_visitor, -> visitor { where(visitor_id: visitor) }
  scope :by_address, -> address { where('unaccent(visitations.address) ILIKE ?', "%#{ address }%" ) }
end
