require_relative 'transaction'
require_relative 'statement'

class Account

  def initialize(statement = Statement.new)
    @balance = 0
    @statement = statement
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    @balance -= amount
  end

  def balance
    @balance
  end

  def statement
    "date || credit || debit || balance"
  end
end
