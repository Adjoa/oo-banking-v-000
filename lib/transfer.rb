class Transfer

  attr_reader :sender, :receiver
  attr_accessor :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = 'pending'
  end

end
