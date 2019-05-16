require_relative "bank_account.rb"

class Transfer
  # your code here

  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    afterTransaction = self.sender.balance - self.amount > 0
    accountAreValid = self.sender.valid? && self.receiver.valid?
    isPending = self.status == "pending"
    return afterTransaction && accountAreValid && isPending
  end

  def execute_transaction
    if valid?
      self.sender.balance -= self.amount
      self.receiver.balance += self.amount
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      self.sender.balance += self.amount
      self.receiver.balance -= self.amount
      self.status = "reversed"
    end
  end

end
