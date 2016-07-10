# == Schema Information
#
# Table name: visitors
#
#  id         :uuid             not null, primary key
#  email      :citext           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Visitor, type: :model do
  context 'respond methods' do
    [:id, :email, :visitations].each do |expected_attribute|
      it { should respond_to expected_attribute }
    end
  end

  context 'Columns' do
    it { should have_db_column(:id)        .of_type(:uuid)    .with_options(null: false) }
    it { should have_db_column(:email)     .of_type(:citext)  .with_options(null: false) }
    it { should have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
    it { should have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
  end

  context 'Indexes' do
    it { should have_db_index(:email) }
  end

  context 'Associations' do
   it { should have_many(:visitations) }
  end

  context 'Validations' do
    it { should validate_presence_of(:email) }
  end
end
