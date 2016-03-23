require 'rails_helper'

RSpec.describe Product do 
  describe 'validations' do
  	it { is_expected.to validate_presence_of :title }
  	it { is_expected.to validate_presence_of :description }
  	it { is_expected.to validate_presence_of :price }
  end

  describe 'associations' do
  	it { is_expected.to have_many :reviews }
  	it { is_expected.to belong_to :category }
  	it { is_expected.to belong_to :user }
  end
  
  describe 'database columns' do
  	it { is_expected.to have_db_column :title }
  	it { is_expected.to have_db_column :description }
  	it { is_expected.to have_db_column :price }
  	it { is_expected.to have_db_index :category_id }
  	it { is_expected.to have_db_index :user_id }
  end
end
