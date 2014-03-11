class MessagesWidget
  def initialize(x, y, width, height, messages)
    raise 'Cannot initialize messages widget when x is nil' unless x
    raise 'Cannot initialize messages widget when y is nil' unless y
    raise 'Cannot initialize messages widget when width is nil' unless width
    raise 'Cannot initialize messages widget when height is nil' unless height
    raise 'Cannot initialize messages widget when messages is nil' unless messages

    @x = x
    @y = y
    @width = width
    @height = height
    @messages = messages
  end

  def draw(display)
    raise 'Cannot draw messages when display is nil' unless display

    y = @y
    (0..@height-1).each do |line|
      msg = @messages.messages[line]
      break unless msg
      x = @x
      msg[:message].each_char do |c|
        display.draw x, y, c, msg[:color], :black
        x += 1
      end
      y += 1
    end
  end

end
