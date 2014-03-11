class MessageBuffer

  def initialize(remember=10)
    @remember = remember
    @messages = Array.new
  end

  def write(message, color=:white)
    @messages << { :message => message, :color => color }
    while @messages.length > @remember
      @messages.shift
    end
  end

  def messages
    @messages
  end

end
