require 'delve/entity'
require 'delve/component/position'
require 'delve/component/symbol'
require 'spyrl/component/door'
require 'spyrl/component/walkable'
require 'spyrl/component/container'
require 'spyrl/component/name'
require 'spyrl/component/artifact'

class FeatureFactory

  def initialize(messages)
    @messages = messages
  end

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
    desk.add ContainerComponent.new(desk, @messages)
    desk
  end


  def ruby
    gem('Ruby', :red)
  end

  def topaz
    gem('Topaz', :yellow)
  end

  def emerald
    gem('Emerald', :green)
  end

  private
  def gem(name, color)
    ruby = Entity.new
    ruby.add NameComponent.new(ruby, name)
    ruby.add SymbolComponent.new(ruby, 'v', color)
    ruby.add WalkableComponent.new(ruby, true)
    ruby.add ArtifactComponent.new(ruby)
    ruby
  end

end

