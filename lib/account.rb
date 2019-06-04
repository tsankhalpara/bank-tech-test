require_relative 'transaction'
require_relative 'statement'

class Account
  attr_reader :balance

  def initialize(statement = Statement.new)
    @balance = 0
    @statement = statement
  end

  def deposit(amount)
    @balance += amount
    update(amount, 0)
  end

  def withdraw(amount)
    @balance -= amount
    update(0, amount)
  end

  def statement
    @statement.all
  end

  def print
    puts 'date || credit || debit || balance'
    @statement.all.each do |transaction|
      date = transaction.date.strftime('%d/%m/%Y')
      result = date + ' || '
      if transaction.credit.zero?
        result += '  || ' + transaction.debit.to_f.to_s
      elsif transaction.debit.zero?
        result += transaction.credit.to_f.to_s + ' ||  '
      else
        result += transaction.credit.to_f.to_s + ' || ' +
        transaction.debit.to_f.to_s
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
