class Transaction
  attr_reader :credit, :debit, :balance, :date

  def initialize(credit, debit, balance)
    @credit = credit
    @debit = debit
    @balance = balance
    @date = Time.now
  end
end
