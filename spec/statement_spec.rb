require 'statement'

describe Statement do

  describe '#initialize' do
    it 'starts off empty' do
      statement = Statement.new
      expect(statement.all).to eq []
    end
  end

  describe 'create transaction' do
    it 'should add transaction to the list' do
      statement = Statement.new
      transaction = Transaction.new(10, nil, 100)
      statement.all << transaction
      expect(statement.all).to eq [transaction]
    end
  end
end
