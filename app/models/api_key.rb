# == Schema Information
#
# Table name: api_keys
#
#  id         :integer          not null, primary key
#  key        :citext           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ApiKey < ActiveRecord::Base
  validates :key, presence: true

  scope :by_key, -> key { where(key: key) }

  before_validation :generate_key!

  private
    def generate_key!
      return if self.persisted?

      loop do
        self.key = SecureRandom.hex(16)
        break unless ApiKey.exists?(key: self.key)
      end
    end
end
