require 'delve/entity'
require 'delve/component/position'
require 'delve/component/movement'
require 'delve/component/symbol'
require 'delve/component/collision'
require 'spyrl/component/walkable'
require 'spyrl/component/open'
require 'spyrl/component/close'
require 'spyrl/component/player_movement'
require 'spyrl/component/random_movement'

class PlayerFactory

  def create(world, engine, input)
    player = Entity.new
    player.add PositionComponent.new(player)
    player.add CollisionComponent.new(player, world)
    player.add MovementComponent.new(player, :eightway)
    player.add SymbolComponent.new(player, '@', :white)
    player.add WalkableComponent.new(player, false)
    player.add OpenComponent.new(player, world)
    player.add CloseComponent.new(player, world)
    player.add PlayerMovementComponent.new(player, engine, input)
    player
  end

  def enemy(world, color)
    enemy = Entity.new
    enemy.add PositionComponent.new(enemy)
    enemy.add CollisionComponent.new(enemy, world)
    enemy.add MovementComponent.new(enemy, :eightway)
    enemy.add SymbolComponent.new(enemy, '@', color)
    enemy.add WalkableComponent.new(enemy, false)
    enemy.add OpenComponent.new(enemy, world)
    enemy.add CloseComponent.new(enemy, world)
    enemy.add RandomMovementComponent.new(enemy)
    enemy
  end

end

