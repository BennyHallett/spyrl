class CloseComponent

  @@diagonal_error = 'Cannot close diagonally'

  def initialize(parent, world)
    raise 'Cannot create close component when parent is nil' unless parent
    raise 'Cannot create close component when parent is nil' unless world

    @parent = parent
    @world = world
  end

  def id
    :close
  end

  def north_west
    raise @@diagonal_error unless diagonal_movement_is_valid
    close -1, -1
  end

  def north_east
    raise @@diagonal_error unless diagonal_movement_is_valid
    close 1, -1
  end

  def south_west
    raise @@diagonal_error unless diagonal_movement_is_valid
    close -1, 1
  end

  def south_east
    raise @@diagonal_error unless diagonal_movement_is_valid
    close 1, 1
  end

  def north
    close 0, -1
  end
  
  def east
    close 1, 0
  end
  
  def south
    close 0, 1
  end

  def west
    close -1, 0
  end

  private
  def diagonal_movement_is_valid
    @parent.has?(:movement) and @parent.get(:movement).style == :eightway
  end

  def close(dx, dy)
    if @parent.has? :position
      pos = @parent.get :position

      entity = @world.at(pos.x + dx, pos.y + dy)
      if entity.respond_to? :has?
        if entity.has? :door
          entity.get(:door).close
        end
      end
    end
  end

end
