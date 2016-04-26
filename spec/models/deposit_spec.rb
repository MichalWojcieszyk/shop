require 'rails_helper'

RSpec.describe Deposit, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of :amount }
  end

  describe 'associations' do
    it { is_expected.to belong_to :user }
  end

  describe 'database columns' do
    it { is_expected.to have_db_column :amount }
    it { is_expected.to have_db_index :user_id }
  end
end
