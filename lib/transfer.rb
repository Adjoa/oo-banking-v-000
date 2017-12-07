class Transfer

  attr_reader :sender, :receiver
  attr_accessor :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if @status == 'pending' && valid? && sender.balance > @amount
      sender.deposit(-@amount)
      receiver.deposit(@amount)
      @status = 'complete'
    end

    if sender.valid? == false
      @status = 'rejected'
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if status == 'complete'
      receiver.deposit(-@amount)
      sender.deposit(@amount)
      @status = 'reversed'
    end
  end

end
