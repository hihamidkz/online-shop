require 'rails_helper'
require 'book'

describe Book do
  fixtures :all

  describe 'validations' do
    let (:book) { books(:first) }

    it 'is ok' do
      expect(book).to be_valid
    end

    it 'title is nil' do
      book.title = nil
      expect(book).to_not be_valid
      expect validate_presence_of(:title)
    end

    it 'author is nil' do
      book.author = nil
      expect(book).to_not be_valid
      expect validate_presence_of(:author)
    end

    it 'price is nil' do
      book.price = nil
      expect(book).to_not be_valid
      expect validate_presence_of(:price)
    end

    it 'year is nil' do
      book.year = nil
      expect(book).to_not be_valid
      expect validate_presence_of(:year)
    end

    it 'title is too long' do
      book.title = 'MyTitleMyTitleMyTitleMyTitleMyTitle'
      expect(book).to_not be_valid
      expect ensure_length_of(:year)
    end

    it 'price is too long' do
      book.price = 10000000;
      expect(book).to_not be_valid
      expect ensure_length_of(:price)
    end

    it 'year is too long' do
      book.year = 20_111;
      expect(book).to_not be_valid
      expect ensure_length_of(:year)
    end

    it 'year is too short' do
      book.year = 200;
      expect(book).to_not be_valid
      expect ensure_length_of(:year)
    end
  end
end
