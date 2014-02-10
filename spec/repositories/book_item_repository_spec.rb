require 'spec_helper'

describe 'BookItemRepository' do

  context 'when target book is not saved' do
    describe 'BookItemRepository#new_book_by_amazon' do
      before do
        @isbn = '9784839919849'
        repo = BookItemRepository.new
        @res = repo.send(:new_book_by_amazon, @isbn)
      end

      it 'should save book data' do
        expect(@res).not_to be_nil
      end
    end

    describe 'BookItemRepository#new_initial_item' do
      before do
        @isbn = '9784839919849'
        repo = BookItemRepository.new
        @res = repo.new_initial_item @isbn
      end

      it 'should save book data' do
        book = Book.find_by_isbn(@isbn)
        expect(book).to be_instance_of Book
      end

      it 'should save item data' do
        expect(@res).not_to be_nil
      end
    end

    describe 'BookItemRepository#new_initial_item' do
      before do
        @isbn = '9784844332763'
        repo = BookItemRepository.new
        @res = repo.new_initial_item @isbn
      end

      it 'should save book data' do
        book = Book.find_by_isbn(@isbn)
        expect(book).to be_instance_of Book
      end

      it 'should save item data' do
        expect(@res).not_to be_nil
      end
    end
  end
end