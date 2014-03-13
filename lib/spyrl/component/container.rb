class ContainerComponent

  def initialize(parent, messages, size=1)
    raise 'Cannot create open component when parent is nil' unless parent

    @parent = parent
    @size = size
    @items = Array.new
    @messages = messages
  end

  def id
    :container
  end

  def size
    @size
  end

  def put(item)
    if @items.count >= @size
      @messages.write 'The container is full.'
    else
      @items << item
    end
  end

  def take
    items = @items
    @items = Array.new
    items
  end

  def list
    @items.collect { |i| i.get(:name).name }
  end

end
