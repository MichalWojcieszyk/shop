require 'rails_helper'

RSpec.describe CategoriesController do
  let (:user_admin) { create :user, admin: 'true', email: 'admin@admin.com' }
  let (:user) { create :user }
  
  before { sign_in user }
  
  describe 'GET #new' do
    before { sign_in user_admin }
    subject { get :new }

    it { is_expected.to render_template :new }
  end

  describe 'GET #edit' do
    before { sign_in user_admin }
    let(:category) { create :category }
    subject { get :edit, id: category.id }

    it { is_expected.to render_template :edit }
  end

  describe 'GET #index' do
    subject { get :index }

    it { is_expected.to render_template :index }
  end

  describe 'GET #show' do
    let(:category) { create :category }
    subject { get :show, id: category.id }

    it { is_expected.to render_template :show }
  end

  describe 'POST #create' do
    before { sign_in user_admin }
    let!(:params) { { category: build(:category).attributes } }
    subject { post :create, params }

    context 'success' do
  	  it { is_expected.to redirect_to category_path(controller.category) }

  	  it 'flashes info' do
  		  subject
  		  expect(flash[:notice]).to eq('Category was successfully created.')
      end

      it 'creates category' do
        expect { subject }.to change(Category, :count).by(1)
      end
    end

    context 'failure' do
      before { allow_any_instance_of(ActiveRecord::Base).to receive(:save) { false } }

      it { is_expected.to render_template :new }
    end
  end

  describe 'PUT #update' do
    before { sign_in user_admin }
    let!(:category) { create :category, name: 'Furnitures' }
    let(:name) { 'Chairs' }
    let!(:params) do
      { id: category.id, category: { name: name } }
  end
    subject { put :update, params }

    context 'success' do
      it { is_expected.to redirect_to category_path(controller.category) }

      it 'flashes info' do
        subject
        expect(flash[:notice]).to eq('Category was successfully updated.')
      end

      context 'updates category' do
        subject { -> { put :update, params } }
        it { is_expected.to change{ category.reload.name}.to(name) }
      end
    end

    context 'failure' do
      before { allow_any_instance_of(ActiveRecord::Base).to receive(:save) { false } }

      it { is_expected.to render_template :edit }
    end
  end

  describe 'DELETE #destroy' do
    before { sign_in user_admin }
    let!(:category) { create :category }
    subject { delete :destroy, id: category.id }

    it { is_expected.to redirect_to categories_path }

    it 'flashes info' do
      subject
      expect(flash[:notice]).to eq('Category was successfully destroyed.')
    end

    it 'destroy category' do
      expect { subject }.to change(Category, :count).by(-1)
    end
  end
end
