class SearchComponent

  def initialize(parent, world)
    raise 'Cannot create open component when parent is nil' unless parent

    @parent = parent
    @world = world
  end

  def id
    :search
  end

  def north
    pos = @parent.get :position
    search @world.at(pos.x, pos.y - 1) if @world.at(pos.x, pos.y - 1).respond_to?(:has?)
  end

  def south
    pos = @parent.get :position
    search @world.at(pos.x, pos.y + 1) if @world.at(pos.x, pos.y + 1).respond_to?(:has?)
  end


  def east
    pos = @parent.get :position
    search @world.at(pos.x + 1, pos.y) if @world.at(pos.x + 1, pos.y).respond_to?(:has?)
  end

  def west
    pos = @parent.get :position
    search @world.at(pos.x - 1, pos.y) if @world.at(pos.x - 1, pos.y).respond_to?(:has?)
  end


  def search(thing)
    if thing.has? :container
      thing.get(:container).list
    end
  end

end
