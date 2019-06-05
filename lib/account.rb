require_relative 'transaction'
require_relative 'statement'

class Account
  attr_reader :balance

  def initialize(statement = Statement.new)
    @balance = 0
    @statement = statement
  end

  def deposit(amount)
    if amount < 0
      raise "Cannot deposit negative amount - please use withdraw service"
    else
      @balance += amount
      update(amount, 0)
    end
    balance
  end

  def withdraw(amount)
    if amount > @balance
      raise "Not enough funds available"
    else
      @balance -= amount
      update(0, amount)
    end
    balance
  end

  def print
    puts 'date || credit || debit || balance'
    @statement.all.reverse.each do |transaction|
      date = transaction.date.strftime('%d/%m/%Y')
      result = date + ' || '
      if transaction.credit.zero?
        result += ' || ' + transaction.debit.to_f.to_s
      else
        result += transaction.credit.to_f.to_s + ' || '
      end
      result += ' || ' + transaction.balance.to_f.to_s
      puts result
    end
  end

  private

  def update(credit, debit)
    transaction = Transaction.new(credit, debit, @balance)
    @statement.all << transaction
  end
end
