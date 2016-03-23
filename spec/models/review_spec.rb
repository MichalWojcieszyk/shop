require 'rails_helper'

RSpec.describe Review do 
	
	describe 'association' do
		it { is_expected.to belong_to :product }
		it { is_expected.to belong_to :user }
	end

	describe 'database columns' do
		it { is_expected.to have_db_column :content }
		it { is_expected.to have_db_column :rating }
		it { is_expected.to have_db_index :user_id }
		it { is_expected.to have_db_index :product_id }
	end

	describe 'validations' do
		it { is_expected.to validate_presence_of :content }
		it { is_expected.to validate_presence_of :rating }
		it { is_expected.to validate_presence_of :user_id }
	end
end