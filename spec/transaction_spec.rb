require 'transaction'
require 'timecop'

describe Transaction do
  describe '#initialize' do
    it 'make a deposit' do
      Timecop.freeze do
      transaction = Transaction.new(10, nil, 100)
      expect(transaction.credit).to eq 10
      expect(transaction.debit).to eq nil
      expect(transaction.balance).to eq 100
      expect(transaction.date).to eq Time.now
      end
    end
    it 'make a withdrawal' do
      Timecop.freeze do
      transaction = Transaction.new(nil, 10, 100)
      expect(transaction.credit).to eq nil
      expect(transaction.debit).to eq 10
      expect(transaction.balance).to eq 100
      expect(transaction.date).to eq Time.now
      end
    end
  end
end
