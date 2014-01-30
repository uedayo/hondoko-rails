require 'spec_helper'

describe LendRepository do

  context 'when no operation exits' do
    describe 'get_last_operation' do
      before do
        repo = LendRepository.new
        @result = repo.get_last_operation 1
      end

      it 'should return nil' do
        expect(@result).to be_nil
      end
    end
  end

  context 'when single operation exits' do
    describe 'get_last_operation' do
      before do
        create(:operation)
        repo = LendRepository.new
        @result = repo.get_last_operation 1
      end

      it 'should return operation' do
        expect(@result).to be_instance_of Operation
      end
    end
  end
end