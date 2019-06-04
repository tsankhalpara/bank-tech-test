require 'account'

describe Account do

  describe '#initialize' do
    it 'starts with a balance of zero' do
      statement = Statement.new
      account = Account.new(statement)
      expect(account.balance).to eq 0
    end
    it 'has a new statement' do
      statement = Statement.new
      account = Account.new(statement)
      expect(account.statement).to eq []
    end
  end

  describe '#deposit' do
    it 'add money to the balance' do
      statement = Statement.new
      account = Account.new(statement)
      account.deposit(15)
      expect(account.balance).to eq 15
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
  end

  # describe '#print' do
  #   it 'prints the statement' do
  #     statement = Statement.new
  #     account = Account.new(statement)
  #     account.deposit(1000)
  #     expect(account.print).to include(1000)
  #   end
  # end

end
