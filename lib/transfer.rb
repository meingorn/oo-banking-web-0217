require "pry"
class Transfer

  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amt)
    @sender = sender
    @receiver = receiver
    @amount = amt
    @status = "pending"
  end

  def valid?
    self.sender.valid? && self.receiver.valid? && (self.sender.balance >= self.amount)
  end

  def execute_transaction
    # binding.pry
    if @status == "pending" && self.valid?
      self.sender.balance -= @amount
      self.receiver.balance += @amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      self.receiver.balance -= @amount
      self.sender.balance += @amount
      @status = "reversed"
    end
  end

end
