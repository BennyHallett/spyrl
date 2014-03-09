require 'delve/widgets/menu'
require 'delve/widgets/multi_line'

require 'spyrl/screens/loading'
require 'spyrl/screens/help'

class TitleScreen

  def initialize(screen_manager)
    @title = MultiLineWidget.new :center, 1, [
' _____            ______ _     ',
'/  ___|           | ___ \ |    ',
'\ `--. _ __  _   _| |_/ / |    ',
' `--. \ `_ \| | | |    /| |    ',
'/\__/ / |_) | |_| | |\ \| |____',
'\____/| .__/ \__, \_| \_\_____/',
'      | |     __/ |            ',
'      |_|    |___/             '
]
    
    @menu = MenuWidget.new 1, 15, {
      'n' => 'New game',
      'h' => 'Help',
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

    if @menu.selected_item == 'Help'
      @manager.push_screen HelpScreen.new(@manager)
    end

    @menu.selected_item == 'Exit'
  end

end
