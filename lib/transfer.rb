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
      sender.withdraw(@amount)
      receiver.deposit(@amount)
    end
    if self.valid?
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
      binding.pry 
    end
  end

end
