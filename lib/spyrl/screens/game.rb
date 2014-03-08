require 'delve/widgets/border'
require 'delve/widgets/viewport'

class GameScreen

  def initialize(world, player, screen_manager)
    @world = world
    @manager = screen_manager
    @player = player
    @boundary = nil
    @game_border = nil
    @viewport = nil

    @world.add_entity @player
  end

  def render(display)
    @boundary ||= BorderWidget.new(0, 0, display.width, display.height)
    @game_border ||= BorderWidget.new(0, 0, display.width - 25, display.height, 'spyrl', :white, :black)
    @viewport ||= ViewportWidget.new 2, 1, display.width - 28, display.height - 2, @world

    @boundary.draw display
    @game_border.draw display

    x = @player.get(:position).x
    y = @player.get(:position).y
    @viewport.focus(x, y)
    @viewport.draw display
  end

  def partial?
    false
  end

  def update(input)
    input = input.wait_for_input
    move = @player.get(:movement)

    move.north if input == 'k'
    move.south if input == 'j'
    move.east if input == 'l'
    move.west if input == 'h'
    move.north_east if input == 'u'
    move.north_west if input == 'y'
    move.south_east if input == 'n'
    move.south_west if input == 'b'

    input == 'x'
  end

end
