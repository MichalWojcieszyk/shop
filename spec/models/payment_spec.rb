require 'rails_helper'

RSpec.describe Payment, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of :quantity }
  end

  describe 'associations' do
    it { is_expected.to belong_to :user }
    it { is_expected.to belong_to :product }
  end

  describe 'database columns' do
    it { is_expected.to have_db_column :amount }
    it { is_expected.to have_db_column :quantity }
    it { is_expected.to have_db_index :user_id }
    it { is_expected.to have_db_index :product_id }
  end
end
