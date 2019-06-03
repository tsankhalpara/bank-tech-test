require_relative 'transaction'
require_relative 'statement'

class Account

  def initialize(statement = Statement.new)
    @balance = 0
    @statement = statement
  end

  def deposit(amount)
    @balance += amount
    update(amount, nil)
  end

  def withdraw(amount)
    @balance -= amount
    update(nil, amount)
  end

  def balance
    @balance
  end

  def statement
    @statement.all
  end

  private

  def update(credit, debit)
    transaction = Transaction.new(credit, debit, @balance)
    @statement.all << transaction
  end
end
