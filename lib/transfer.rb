require 'pry'

class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :status
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    if sender.valid? && receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
    if self.valid? && self.status == "pending"
      sender.withdraw(self.amount)
      receiver.deposit(self.amount)
    end
    if self.valid?
      self.status = "complete"
    else
      receiver.withdraw(self.amount)
      sender.deposit(self.amount)
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      receiver.withdraw(self.amount)
      sender.deposit(self.amount)
      self.status = "reversed"
    end
  end

end
