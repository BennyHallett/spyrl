require 'delve/component/position'

class DropComponent

  def initialize(parent, world)
    raise 'Cannot create drop component when parent is nil' unless parent
    raise 'Cannot create drop component when world is nil' unless world

    @parent = parent
    @world = world
  end

  def id
    :drop
  end

  def drop
    if @parent.has?(:container) and @parent.has?(:position)
      items = @parent.get(:container).take
      pos = @parent.get(:position)
      items.each do |i|
        p = PositionComponent.new i
        p.set pos.x, pos.y
        i.add(p)
        @world.add_entity i
      end
    end
  end

end
