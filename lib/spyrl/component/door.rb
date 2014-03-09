class DoorComponent
  def initialize(parent, open=false)
    raise 'Cannot create door component when parent is nil' unless parent

    @parent = parent
    @open = open
  end

  def id
    :door
  end

  def open?
    @open
  end

  def open
    open = true
    if @parent.has? :walkable
      @parent.get(:walkable).set(true)
    end
    if @parent.has? :symbol
      @parent.get(:symbol).update('-')
    end
  end

  def close
    open = false
    if @parent.has? :walkable
      @parent.get(:walkable).set(false)
    end
    if @parent.has? :symbol
      @parent.get(:symbol).update('+')
    end
  end

end
