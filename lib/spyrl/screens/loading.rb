require 'delve/widgets/text'
require 'delve/generator/rogue'

require 'spyrl/world'
require 'spyrl/factory/player'
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
    @world = World.new(RogueGenerator.new(128, 64))
    @player = @player_factory.create @world
    randomize_player_location
    @manager.push_screen GameScreen.new(@world, @player, @manager)
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
