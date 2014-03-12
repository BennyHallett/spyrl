class PlayerMovementComponent
  def initialize(parent, engine, input, world)
    raise 'Cannot create player movement component when parent is nil' unless parent
    raise 'Cannot create player movement component when engine is nil' unless engine

    @parent = parent
    @engine = engine
    @input = input
    @world = world
  end

  def id
    :actor
  end

  def act
    char = @input.wait_for_input
    move = @parent.get(:movement)
    pos = @parent.get(:position)
    melee = @parent.get(:melee)

    if char == 'k'
      thing = @world.at(pos.x, pos.y - 1)
      if thing.respond_to? :has? and thing.has?(:attackable)
        melee.attack(thing)
      else
        move.north
      end
    end

    if char == 'j'
      thing = @world.at(pos.x, pos.y + 1)
      if thing.respond_to? :has? and thing.has?(:attackable)
        melee.attack(thing)
      else
        move.south
      end
    end

    if char == 'l'
      thing = @world.at(pos.x + 1, pos.y)
      if thing.respond_to? :has? and thing.has?(:attackable)
        melee.attack(thing)
      else
        move.east
      end
    end

    if char == 'h'
      thing = @world.at(pos.x - 1, pos.y)
      if thing.respond_to? :has? and thing.has?(:attackable)
        melee.attack(thing)
      else
        move.west
      end
    end

    if char == 'o'
      open_dir = @input.wait_for_input
      open = @parent.get(:open)

      open.north if open_dir == 'k'
      open.south if open_dir == 'j'
      open.east if open_dir == 'l'
      open.west if open_dir == 'h'
    end

   if char == 'c'
      close_dir = @input.wait_for_input
      close = @parent.get(:close)

      close.north if close_dir == 'k'
      close.south if close_dir == 'j'
      close.east if close_dir == 'l'
      close.west if close_dir == 'h'
    end

    @engine.lock
    char == 'x'
  end

end
