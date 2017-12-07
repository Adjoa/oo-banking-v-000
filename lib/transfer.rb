class Transfer

  attr_reader :sender, :receiver
  attr_accessor :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if status == 'pending'
      sender.balance -= amount
      receiver.deposit(amount)
    end
    @status = 'complete'
  end



end
