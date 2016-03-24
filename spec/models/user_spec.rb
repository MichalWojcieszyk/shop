require 'rails_helper'

RSpec.describe User do 
	
	describe 'association' do
		it { is_expected.to have_many :products }
		it { is_expected.to have_many :reviews }
	end

	describe 'database columns' do
		it { is_expected.to have_db_column :email }
		it { is_expected.to have_db_column :admin }
		it { is_expected.to have_db_column :firstname }
		it { is_expected.to have_db_column :lastname }
		it { is_expected.to have_db_column :avatar }
	end

	describe 'validations' do
		it { is_expected.to validate_presence_of :firstname }
		it { is_expected.to validate_presence_of :lastname }
		it { is_expected.to validate_presence_of :email }
	end

	it "by default isn't admin" do
		expect(User.new).to_not be_admin
	end
end