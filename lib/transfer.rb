require 'pry'

class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize (sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    if @sender.valid? && @receiver.valid?
      true
    end
  end

  def execute_transaction
    if self.status = "pending"
      if @amount > @sender.balance
        "Transaction rejected. Please check your account balance."
        @self.status = "rejected"
      else
        @sender.balance = @sender.balance - @amount
        @receiver.balance = @receiver.balance + @amount
        self.status = "complete"
        # binding.pry
      end
    end
  end

  def reverse_transfer
    if self.status = "complete"
      @receiver.balance = @receiver.balance - @amount
      @sender.balance = @sender.balance + @amount
      @self.status = "reversed"
    end
  end

end