require 'pry'
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
    # binding.pry
  end

  def execute_transaction
    if @sender.valid? == false
      return "Transaction rejected. Please check your account balance."
    elsif @status == 'pending' && @sender.valid?
      @sender.balance -= @amount
      @receiver.deposit(@amount)
      @status = 'complete'
    end
  end
  #
  # def reverse_transfer
  #   if status == 'complete'
  #     receiver.balance -= amount
  #     sender.deposit(amount)
  #     status = 'reversed'
  #   end
  # end

end
