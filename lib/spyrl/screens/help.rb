require 'delve/widgets/multi_line'

class HelpScreen

  def initialize(screen_manager)
    @text = MultiLineWidget.new 1, 1, [
  "SpyRL",
  "",
  "Move with the vi keys",
  "Open closed doors (+) with the 'o' key",
  "Close opened doors (-) with the 'c' key"
]
    
    @manager = screen_manager
  end

  def render(display)
    @text.draw display
  end

  def partial?
    false
  end

  def update(input)
    input = input.wait_for_input

    @manager.pop_screen if input == 'x'
    false
  end

end
