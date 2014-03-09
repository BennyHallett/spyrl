require 'delve/entity'
require 'delve/component/position'
require 'delve/component/movement'
require 'delve/component/symbol'
require 'delve/component/collision'
require 'spyrl/component/walkable'
require 'spyrl/component/open'
require 'spyrl/component/close'

class PlayerFactory

  def create(world)
    player = Entity.new
    player.add PositionComponent.new(player)
    player.add CollisionComponent.new(player, world)
    player.add MovementComponent.new(player, :eightway)
    player.add SymbolComponent.new(player, '@', :yellow)
    player.add WalkableComponent.new(player, false)
    player.add OpenComponent.new(player, world)
    player.add CloseComponent.new(player, world)
    player
  end

end

