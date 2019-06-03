require 'account'

describe Account do

  describe '#initialize' do
    it 'starts with a balance of zero' do
      account = Account.new
      expect(account.balance).to eq 0
    end
  end

  describe '#deposit' do
    it 'add money to the balance' do
      account = Account.new
      account.deposit(15)
      expect(account.balance).to eq 15
    end
  end

end
