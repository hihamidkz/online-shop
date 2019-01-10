require 'rails_helper'
require 'book'
require 'books_controller'

describe BooksController, type: :controller do
  fixtures :all

  describe 'GET books#index' do
    it do
      get :index
      expect(response).to be_success
    end
  end

  describe 'GET books#show' do
    it do
      book = Book.create! title: 'Any', author: 'Some', price: 10, year: 2010
      get :show, params: { id: book.id }
      expect(assigns(:book)).to eq(book)
    end
  end

  describe 'POST books#create' do
    it 'with the correct parameters' do
      expect {
        post :create, :params => { :book => { :title => 'Any', :author => 'Some', :price => 10, :year => 2011 }, :format => :json }
      }.to change(Book, :count).by(1)
      expect(response).to render_template :show
    end

    it 'with the incorrect parameters' do
      expect {
        post :create, :params => { :book => { :title => nil, :author => 'Some', :price => 10, :year => 2011 }, :format => :json }
      }.to_not change(Book, :count)
    end
  end

  describe 'PUT books#update' do
    let (:book) { Book.first }

    it do
      put :update, params: { id: book.id, :book => { :title => 'new title' } }
      book.reload
      expect(book.title).to eq('new title')
    end
  end

  describe 'DELETE books#destroy' do
    let (:book) { Book.first }

    it do
      expect {
        delete :destroy, params: { id: book.id }
      }.to change(Book, :count).by(-1)
    end
  end
end