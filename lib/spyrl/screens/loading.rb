require 'delve/widgets/text'
require 'delve/generator/rogue'
require 'delve/scheduler/simple_scheduler'
require 'delve/event_queue'
require 'delve/engine'

require 'spyrl/world'
require 'spyrl/factory/player'
require 'spyrl/factory/feature'
require 'spyrl/screens/game'
require 'spyrl/message_buffer'

class LoadingScreen

  def initialize(screen_manager)
    @manager = screen_manager
    @text = TextWidget.new :center, :center, 'Creating world (this may take a while)'
    @messages = MessageBuffer.new
    @messages.write 'Welcome to SpyRL', :green
    @messages.write 'Collect the 6 artifacts and escape before the other spies do', :green
    @player_factory = PlayerFactory.new @messages
    @player = nil
    @world = nil
  end

  def render(display)
    @text.draw display
  end

  def partial?
    false
  end

  def update(input)
    scheduler = SimpleScheduler.new EventQueue.new
    engine = Engine.new scheduler
    @world = World.new(RogueGenerator.new(128, 64), FeatureFactory.new(@messages), scheduler)
    @player = @player_factory.create @world, engine, input
    randomize_location @player
    @world.add_entity @player, true

    create_enemy :red
    create_enemy :blue
    create_enemy :green
    create_enemy :yellow
    create_enemy :cyan

    @manager.push_screen GameScreen.new(@world, @player, @manager, engine, @messages)
    false
  end

  private
  def create_enemy(color)
    enemy = @player_factory.enemy @world, color
    randomize_location enemy
    @world.add_entity enemy, true
  end

  def randomize_location(thing)
    pos = @world.random_free_location
    thing.get(:position).set(pos[:x], pos[:y])
  end

end
