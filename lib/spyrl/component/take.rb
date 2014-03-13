class TakeComponent

  def initialize(parent, world)
    raise 'Cannot create take component when parent is nil' unless parent
    raise 'Cannot create take component when parent is nil' unless world

    @parent = parent
    @world = world
  end

  def id
    :take
  end

  def north
    pos = @parent.get :position
    take @world.at(pos.x, pos.y - 1) if @world.at(pos.x, pos.y - 1).respond_to?(:has?)
  end

  def south
    pos = @parent.get :position
    take @world.at(pos.x, pos.y + 1) if @world.at(pos.x, pos.y + 1).respond_to?(:has?)
  end


  def east
    pos = @parent.get :position
    take @world.at(pos.x + 1, pos.y) if @world.at(pos.x + 1, pos.y).respond_to?(:has?)
  end

  def west
    pos = @parent.get :position
    take @world.at(pos.x - 1, pos.y) if @world.at(pos.x - 1, pos.y).respond_to?(:has?)
  end


  def take(thing)
    if thing.has? :container and @parent.has? :container
      list = thing.get(:container).list
      items = thing.get(:container).take
      items.each do |i|
        @parent.get(:container).put(i)
      end
      list
    end
  end

end
