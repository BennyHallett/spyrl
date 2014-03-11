require 'delve/widgets/border'
require 'delve/widgets/viewport'
require 'delve/widgets/text'

class GameScreen

  def initialize(world, player, screen_manager, engine)
    @world = world
    @manager = screen_manager
    @player = player
    @engine = engine
    @boundary = nil
    @game_border = nil
    @viewport = nil
  end

  def render(display)
    @boundary ||= BorderWidget.new(0, 0, display.width, display.height)
    @game_border ||= BorderWidget.new(0, 0, display.width - 25, display.height, 'spyrl', :white, :black)
    @viewport ||= ViewportWidget.new 2, 1, display.width - 28, display.height - 2, @world
    @name ||= TextWidget.new display.width - 24, 1, @player.get(:name).name

    @boundary.draw display
    @game_border.draw display

    x = @player.get(:position).x
    y = @player.get(:position).y
    @viewport.focus(x, y)
    @viewport.draw display
    @name.draw display
  end

  def partial?
    false
  end

  def update(input)

    @engine.unlock
    false
  end

end
