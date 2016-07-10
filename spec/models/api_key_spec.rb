# == Schema Information
#
# Table name: api_keys
#
#  id         :integer          not null, primary key
#  key        :citext           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe ApiKey, type: :model do
  context 'respond methods' do
    [:id, :key].each do |expected_attribute|
      it { should respond_to expected_attribute }
    end
  end

  context 'Columns' do
    it { should have_db_column(:id) .of_type(:integer).with_options(null: false) }
    it { should have_db_column(:key).of_type(:citext) .with_options(null: false) }
  end

  context 'Indexes' do
    it { should have_db_index(:key) }
  end
end
