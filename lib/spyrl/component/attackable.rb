class AttackableComponent
  def initialize(parent, messages)
    raise 'Cannot create attackable component when parent is nil' unless parent
    raise 'Cannot create attackable component when messages is nil' unless messages

    @parent = parent
    @messages = messages
  end

  def id
    :attackable
  end

  def attacked(damage)
    if @parent.has? :health
      @parent.get(:health).reduce(damage)
      @messages.write("#{@parent.get(:name).name} was hit for #{damage} points", :red)
    end
  end

end
