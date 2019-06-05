require 'account'

describe Account do
  describe '#initialize' do
    it 'starts with a balance of zero' do
      statement = Statement.new
      account = Account.new(statement)
      expect(account.balance).to eq 0
    end
  end

  describe '#deposit' do
    it 'add money to the balance' do
      statement = Statement.new
      account = Account.new(statement)
      account.deposit(15)
      expect(account.balance).to eq 15
    end
    it 'throws error with negative amount' do
      statement = Statement.new
      account = Account.new(statement)
      expect { account.deposit(-10) }.to raise_error "Cannot deposit negative amount - please use withdraw service"
    end
  end

  describe '#withdraw' do
    it 'deducts money from the balance' do
      statement = Statement.new
      account = Account.new(statement)
      account.deposit(15)
      account.withdraw(10)
      expect(account.balance).to eq 5
    end
    it 'throws error when trying to withdraw more than current balance' do
      statement = Statement.new
      account = Account.new(statement)
      expect { account.withdraw(100) }.to raise_error "Not enough funds available"
    end
  end

  describe '#print' do
    it 'prints statement' do
      statement = Statement.new
      account = Account.new(statement)
      expect {account.print}.to output("date || credit || debit || balance\n").to_stdout
    end
  end
end
