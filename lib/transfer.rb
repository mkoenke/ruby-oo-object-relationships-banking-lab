class Transfer
  # your code here

  attr_accessor :sender, :receiver, :amount, :status

  def initialize (sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid? 
  end

  def execute_transaction
  end

  def reverse_transfer
  end

end
