class BankAccount
  attr_reader :name, :balance, :status
  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(amount)
    @balance += amount
  end

  def display_balance
    "Your balance is $#{self.balance}."
  end

  def valid? 
    if @balance > 0 && @status == "open"
      true 
    end 
  end 
end
