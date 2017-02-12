require "pry"
class BankAccount

  attr_accessor :balance, :status
  attr_reader :name

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(num)
    self.balance += num
  end

  def display_balance
    "Your balance is $#{self.balance}."
  end

  def valid?
    if @status == "open"
      return true if @balance > 0
    end
    false
  end

  def close_account
    @status = "closed"
  end

end
