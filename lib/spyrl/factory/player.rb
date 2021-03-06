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
require 'spyrl/component/name'
require 'spyrl/component/health'
require 'spyrl/component/attackable'
require 'spyrl/component/melee'
require 'spyrl/component/search'
require 'spyrl/component/container'
require 'spyrl/component/take'
require 'spyrl/component/drop'

class PlayerFactory

  def initialize(messages)
    @messages = messages
  end

  def create(world, engine, input)
    player = Entity.new
    add_basic_components player, world, :white
    player.add PlayerMovementComponent.new(player, engine, input, world, @messages)
    player
  end

  def enemy(world, color)
    enemy = Entity.new
    add_basic_components enemy, world, color
    enemy.add RandomMovementComponent.new(enemy, world)
    enemy
  end

  private
  def add_basic_components(player, world, color)
    player.add PositionComponent.new(player)
    player.add CollisionComponent.new(player, world)
    player.add MovementComponent.new(player, :fourway)
    player.add SymbolComponent.new(player, '@', color)
    player.add WalkableComponent.new(player, false)
    player.add OpenComponent.new(player, world)
    player.add CloseComponent.new(player, world)
    player.add NameComponent.new(player, "The #{color.to_s.capitalize} spy")
    player.add HealthComponent.new(player, 10)
    player.add AttackableComponent.new(player, @messages)
    player.add MeleeComponent.new(player, 1)
    player.add ContainerComponent.new(player, 1)
    player.add SearchComponent.new(player, world)
    player.add TakeComponent.new(player, world)
    player.add DropComponent.new(player, world)
  end

end

