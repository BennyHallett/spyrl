class RandomMovementComponent
  def initialize(parent, world)
    raise 'Cannot create random movement component when parent is nil' unless parent

    @parent = parent
    @world = world
  end

  def id
    :actor
  end

  def act
    if @parent.has? :melee and enemy_nearby
      enemy = get_first_enemy
      @parent.get(:melee).attack(enemy)
    elsif @parent.has? :movement
      dir = (rand * 4).floor
      move = @parent.get :movement

      move.north if dir == 0
      move.east if dir == 1
      move.south if dir == 2
      move.west if dir == 3
    end

    false
  end

  private
  def enemy_nearby
    pos = @parent.get :position
    enemy_at(pos.x, pos.y + 1) or enemy_at(pos.x, pos.y - 1) or enemy_at(pos.x + 1, pos.y) or enemy_at(pos.x - 1, pos.y)
  end

  def enemy_at(x, y)
    @world.at(x, y).respond_to?(:has?) and @world.at(x, y).has?(:attackable)
  end

  def get_first_enemy
    pos = @parent.get :position
    return @world.at(pos.x, pos.y + 1) if enemy_at(pos.x, pos.y + 1)
    return @world.at(pos.x, pos.y - 1) if enemy_at(pos.x, pos.y - 1)
    return @world.at(pos.x + 1, pos.y) if enemy_at(pos.x + 1, pos.y)
    return @world.at(pos.x - 1, pos.y) if enemy_at(pos.x - 1, pos.y)
    nil
  end

end
