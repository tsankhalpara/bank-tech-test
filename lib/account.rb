require_relative 'transaction'
require_relative 'statement'

class Account

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

  def balance
    @balance
  end

  def statement
    @statement.all
  end

  def transactions
    @transactions
  end

  def print
    puts 'date || credit || debit || balance'
    @statement.all.each do |transaction|
      if transaction.credit == 0
      result = transaction.date.strftime('%d/%m/%Y') + ' || '
      result += '  || '
      result += transaction.debit.to_f.to_s
      result += ' || ' + transaction.balance.to_f.to_s
    elsif transaction.debit == 0
      result = transaction.date.strftime('%d/%m/%Y') + ' || '
      result += transaction.credit.to_f.to_s
      result += ' || '
      result += '  || ' + transaction.balance.to_f.to_s
    else
      result = transaction.date.strftime('%d/%m/%Y') + ' || '
      result += transaction.credit.to_f.to_s
      result += ' || '
      result += transaction.debit.to_f.to_s
      result += ' || ' + transaction.balance.to_f.to_s
    end
      puts result
    end
  end

  private

  def update(credit, debit)
    transaction = Transaction.new(credit, debit, @balance)
    @statement.all << transaction
  end
end
