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
    if self.status == "pending" && self.valid? && @amount < @sender.balance
      @sender.balance = @sender.balance - @amount
      @receiver.balance = @receiver.balance + @amount
      self.status = "complete"
    else
      self.status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      @receiver.balance = @receiver.balance - @amount
      @sender.balance = @sender.balance + @amount
      self.status = "reversed"
    end
  end

  # def execute_transaction
  #   if self.status = "pending"
  #     if @sender.balance = @sender.balance - @amount
  #        @receiver.balance = @receiver.balance + @amount
  #        self.status = "complete"



end