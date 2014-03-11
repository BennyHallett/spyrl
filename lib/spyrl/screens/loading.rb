require 'delve/widgets/text'
require 'delve/generator/rogue'
require 'delve/scheduler/simple_scheduler'
require 'delve/event_queue'
require 'delve/engine'

require 'spyrl/world'
require 'spyrl/factory/player'
require 'spyrl/factory/feature'
require 'spyrl/screens/game'

class LoadingScreen

  def initialize(screen_manager)
    @manager = screen_manager
    @text = TextWidget.new :center, :center, 'Creating world (this may take a while)'
    @player_factory = PlayerFactory.new
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
    @world = World.new(RogueGenerator.new(128, 64), FeatureFactory.new, scheduler)
    @player = @player_factory.create @world, engine, input
    randomize_player_location
    @manager.push_screen GameScreen.new(@world, @player, @manager, engine)
    false
  end

  private
  def randomize_player_location
    rx = (rand * @world.width).floor
    ry = (rand * @world.height).floor

    while !@world.free(rx, ry)
      rx = (rand * @world.width).floor
      ry = (rand * @world.height).floor
    end

    @player.get(:position).set(rx, ry)
  end

end
