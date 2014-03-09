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

end

