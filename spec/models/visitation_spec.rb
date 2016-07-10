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

require 'rails_helper'

RSpec.describe Visitation, type: :model do
  context 'respond methods' do
    [:id, :visitor_id, :address, :created_at, :updated_at].each do |expected_attribute|
      it { should respond_to expected_attribute }
    end
  end

  context 'Columns' do
    it { should have_db_column(:id)        .of_type(:uuid)    .with_options(null: false) }
    it { should have_db_column(:visitor_id).of_type(:integer) .with_options(null: false) }
    it { should have_db_column(:address)   .of_type(:citext)  .with_options(null: false) }
    it { should have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
    it { should have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
  end

  context 'Indexes' do
    it { should have_db_index(:visitor_id) }
    it { should have_db_index(:address) }
  end

  context 'Associations' do
   it { should belong_to(:visitor) }
  end

  context 'Validations' do
    it { should validate_presence_of(:visitor_id) }
    it { should validate_presence_of(:address) }
  end
end
