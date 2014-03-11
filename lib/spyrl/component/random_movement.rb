class RandomMovementComponent
  def initialize(parent)
    raise 'Cannot create random movement component when parent is nil' unless parent

    @parent = parent
  end

  def id
    :actor
  end

  def act
    if @parent.has? :movement
      dir = (rand * 4).floor
      move = @parent.get :movement

      move.north if dir == 0
      move.east if dir == 1
      move.south if dir == 2
      move.west if dir == 3
    end

    false
  end

end
