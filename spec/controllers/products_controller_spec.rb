require 'rails_helper'

RSpec.describe ProductsController do
  let(:user) { create :user }
  let(:category) { create :category }
  
  before { sign_in user }
  
  describe 'GET #new' do
    subject { get :new }

    it { is_expected.to render_template :new }
  end

  describe 'GET #edit' do
    let(:product) { create :product, category: category, user: user }
    subject { get :edit, id: product.id }

    it { is_expected.to render_template :edit }
  end

  describe 'GET #index' do
    subject { get :index }

    it { is_expected.to render_template :index }
  end

  describe 'GET #show' do
    let(:product) { create :product, category: category, user: user }
    subject { get :show, id: product.id }

    it { is_expected.to render_template :show }
  end

  describe 'PUT #update' do
    let!(:product) { create :product, category: category, user: user }
    let(:title) { 'Ball' }
    let!(:params) do
      { id: product.id, category_id: category.id, product: { title: title} }
    end
    
    subject { put :update, params }

    context 'success' do
      it { is_expected.to redirect_to category_product_url(category, product) }

      it 'flashes info' do
        subject
        expect(flash[:notice]).to eq('Product was successfully updated.')
      end

      context 'updates product' do
        subject { -> { put :update, params } }
        it { is_expected.to change{ product.reload.title }.to(title) }
      end
    end

    context 'failure' do
      before { allow_any_instance_of(ActiveRecord::Base).to receive(:save) { false } }

      it { is_expected.to render_template :edit }
    end
  end

  describe 'DELETE #destroy' do
    before { sign_in user }
    let!(:product) { create :product, category: category, user: user }
    subject { delete :destroy, id: product.id }

    it { is_expected.to redirect_to products_path }

    it 'flashes info' do
      subject
      expect(flash[:notice]).to eq('Product was successfully destroyed.')
    end

    it 'destroy product' do
      expect { subject }.to change(Product, :count).by(-1)
    end
  end
end
