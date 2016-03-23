require 'rails_helper'

RSpec.describe Category do
  describe 'validations' do
    it { should validate_uniqueness_of(:name) }
  end

  describe 'associations' do
  	it { is_expected.to have_many :products }
  end
end