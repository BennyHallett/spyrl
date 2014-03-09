require 'delve/entity'
require 'delve/component/position'
require 'delve/component/symbol'
require 'spyrl/component/door'
require 'spyrl/component/walkable'

class FeatureFactory

  def door(x, y)
    door = Entity.new
    pos = PositionComponent.new(door)
    pos.set(x, y)
    door.add pos
    door.add DoorComponent.new(door)
    door.add SymbolComponent.new(door, '+')
    door.add WalkableComponent.new(door, false)
    door
  end

  def desk(x, y)
    desk = Entity.new
    pos = PositionComponent.new(desk)
    pos.set x, y
    desk.add pos
    desk.add SymbolComponent.new(desk, '=')
    desk.add WalkableComponent.new(desk, false)
    desk
  end

end

