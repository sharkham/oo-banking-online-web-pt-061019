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
    if !self.valid?
      binding.pry
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    #Do the transfer IF both accounts are still valid after
    #withdrawing amount.
    #if sender.withdraw(@amount)
    elsif self.valid? && self.status == "pending"
      sender.withdraw(@amount)
      receiver.deposit(@amount)
      self.status = "complete"

    end
  end
end
