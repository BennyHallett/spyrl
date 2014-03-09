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
    char = input.wait_for_input
    move = @player.get(:movement)

    move.north if char == 'k'
    move.south if char == 'j'
    move.east if char == 'l'
    move.west if char == 'h'
    move.north_east if char == 'u'
    move.north_west if char == 'y'
    move.south_east if char == 'n'
    move.south_west if char == 'b'

    if char == 'o'
      #puts 'Which direction?'
      open_dir = input.wait_for_input
      open = @player.get(:open)

      open.north if open_dir == 'k'
      open.south if open_dir == 'j'
      open.east if open_dir == 'l'
      open.west if open_dir == 'h'
      open.north_east if open_dir == 'u'
      open.north_west if open_dir == 'y'
      open.south_east if open_dir == 'n'
      open.south_west if open_dir == 'b'
    end

    if char == 'c'
      #puts 'Which direction?'
      close_dir = input.wait_for_input
      close = @player.get(:close)

      close.north if close_dir == 'k'
      close.south if close_dir == 'j'
      close.east if close_dir == 'l'
      close.west if close_dir == 'h'
      close.north_east if close_dir == 'u'
      close.north_west if close_dir == 'y'
      close.south_east if close_dir == 'n'
      close.south_west if close_dir == 'b'
    end

    char == 'x'
  end

end
