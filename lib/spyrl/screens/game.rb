require 'delve/widgets/border'
require 'delve/widgets/viewport'
require 'delve/widgets/text'
require 'delve/widgets/progress'

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
    @game_border ||= BorderWidget.new(0, 0, display.width - 25, display.height - 5, 'spyrl', :white, :black)
    @text_border ||= BorderWidget.new(0, display.height - 6, display.width, 6)
    @viewport ||= ViewportWidget.new 2, 1, display.width - 28, display.height - 7, @world
    @name ||= TextWidget.new display.width - 24, 1, @player.get(:name).name
    @health ||= ProgressWidget.new display.width - 24, 2, 22, @player.get(:health).current, @player.get(:health).max, :green, :white

    @boundary.draw display
    @game_border.draw display
    @text_border.draw display

    x = @player.get(:position).x
    y = @player.get(:position).y
    @viewport.focus(x, y)
    @viewport.draw display
    @name.draw display
    @health.draw display
  end

  def partial?
    false
  end

  def update(input)

    @engine.unlock
    false
  end

end
