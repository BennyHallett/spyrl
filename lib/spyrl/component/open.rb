class OpenComponent

  @@diagonal_error = 'Cannot open diagonally'

  def initialize(parent, world)
    raise 'Cannot create open component when parent is nil' unless parent
    raise 'Cannot create world component when parent is nil' unless world

    @parent = parent
    @world = world
  end

  def id
    :open
  end

  def north_west
    raise @@diagonal_error unless diagonal_movement_is_valid
    open -1, -1
  end

  def north_east
    raise @@diagonal_error unless diagonal_movement_is_valid
    open 1, -1
  end

  def south_west
    raise @@diagonal_error unless diagonal_movement_is_valid
    open -1, 1
  end

  def south_east
    raise @@diagonal_error unless diagonal_movement_is_valid
    open 1, 1
  end

  def north
    open 0, -1
  end
  
  def east
    open 1, 0
  end
  
  def south
    open 0, 1
  end

  def west
    open -1, 0
  end

  private
  def diagonal_movement_is_valid
    @parent.has?(:movement) and @parent.get(:movement).style == :eightway
  end

  def open(dx, dy)
    if @parent.has? :position
      pos = @parent.get :position

      entity = @world.at(pos.x + dx, pos.y + dy)
      if entity.respond_to? :has?
        if entity.has? :door
          entity.get(:door).open
        end
      end
    end
  end

end
