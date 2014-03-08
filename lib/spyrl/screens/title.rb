require 'delve/widgets/menu'
require 'delve/widgets/text'

require 'spyrl/screens/loading'

class TitleScreen

  def initialize(screen_manager)
    @title = TextWidget.new :center, 1, 'spyrl - the roguelike'
    
    @menu = MenuWidget.new 1, 15, {
      'n' => 'New game',
      'x' => 'Exit'
    }
    @manager = screen_manager
  end

  def render(display)
    @title.draw display
    @menu.draw display
  end

  def partial?
    false
  end

  def update(input)
    input = input.wait_for_input

    @menu.next if input == :down_arrow
    @menu.prev if input == :up_arrow

    @menu.select(input)

    if @menu.selected_item == 'New game'
      @manager.push_screen LoadingScreen.new(@manager)
    end

    @menu.selected_item == 'Exit'
  end

end
