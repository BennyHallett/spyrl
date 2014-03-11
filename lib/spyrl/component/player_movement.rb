class PlayerMovementComponent
  def initialize(parent, engine, input)
    raise 'Cannot create player movement component when parent is nil' unless parent
    raise 'Cannot create player movement component when engine is nil' unless engine

    @parent = parent
    @engine = engine
    @input = input
  end

  def id
    :actor
  end

  def act
    char = @input.wait_for_input
    move = @parent.get(:movement)

    move.north if char == 'k'
    move.south if char == 'j'
    move.east if char == 'l'
    move.west if char == 'h'
    move.north_east if char == 'u'
    move.north_west if char == 'y'
    move.south_east if char == 'n'
    move.south_west if char == 'b'

    if char == 'o'
      open_dir = @input.wait_for_input
      open = @parent.get(:open)

      open.north if open_dir == 'k'
      open.south if open_dir == 'j'
      open.east if open_dir == 'l'
      open.west if open_dir == 'h'
      open.north_east if open_dir == 'u'
      open.north_west if open_dir == 'y'
      open.south_east if open_dir == 'n'
      open.south_west if open_dir == 'b'
    end

   if char == 'c'
      close_dir = @input.wait_for_input
      close = @parent.get(:close)

      close.north if close_dir == 'k'
      close.south if close_dir == 'j'
      close.east if close_dir == 'l'
      close.west if close_dir == 'h'
      close.north_east if close_dir == 'u'
      close.north_west if close_dir == 'y'
      close.south_east if close_dir == 'n'
      close.south_west if close_dir == 'b'
    end

    @engine.lock
    char == 'x'
  end

end
