require 'spec_helper'

describe 'BookRepository' do

  context 'when target book is exist' do
    describe 'BookRepository#find_by_keywords title' do
      before do
        create(:check_in)
        repo = BookRepository.new
        @res = repo.find_by_keywords "OS"
      end

      it 'should return book data' do
        expect(@res).not_to be_empty
      end
    end

    describe 'BookRepository#find_by_keywords author' do
      before do
        create(:check_in)
        repo = BookRepository.new
        @res = repo.find_by_keywords "川合"
      end

      it 'should return book data' do
        expect(@res).not_to be_empty
      end
    end

    describe 'BookRepository#find_by_keywords author' do
      before do
        create(:check_in)
        repo = BookRepository.new
        @res = repo.find_by_keywords "Martin アジャイル"
      end

      it 'should return book data' do
        expect(@res).not_to be_empty
      end
    end
  end
end