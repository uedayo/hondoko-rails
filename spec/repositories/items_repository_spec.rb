require 'spec_helper'

describe 'ItemsRepository' do

  context 'when target book is not saved' do
    describe 'ItemsRepository#find' do
      before do
        book_id = '1'
        repo = ItemsRepository.new
        @res = repo.send(:find, book_id)
      end

      it 'should return item data' do
        expect(@res).not_to be_nil
      end
    end
  end

  context 'when target check_out has check_in' do
    describe 'ItemsRepository#join_check_in_and_out' do
      before do
        repo = ItemsRepository.new
        @res = repo.send(:join_check_out_and_in, '1')
      end

      it 'should return check out and in data' do
        expect(@res).not_to be_nil
      end
    end
  end

  context 'when target check_out doesn\'t have check_in' do
    describe 'ItemsRepository#join_check_in_and_out' do
      before do
        repo = ItemsRepository.new
        @res = repo.send(:join_check_out_and_in, '2')
      end

      it 'should return check out and in data' do
        expect(@res).not_to be_nil
      end
    end
  end
end