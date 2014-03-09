class World

  def initialize(generator, feature_factory)
    raise 'Cannot create world when generator is nil' unless generator

    @world = Hash.new
    @entities = Array.new
    @width = generator.width
    @height = generator.height
    generator.generate do |x, y, height|
      @world[key_for(x.floor, y.floor)] = tile_for_height(height)

      add_entity(feature_factory.door(x.floor, y.floor)) if height.floor == 2
    end
  end

  def at(x, y)
    key = key_for(x, y)
    # This is super inefficient
    found = @entities.select { |e| e.get(:position).x == x and e.get(:position).y == y }
    entity = found.first
    if entity
      return entity
    else
      return @world[key_for(x, y)]
    end
  end

  def entities
    @entities
  end

  def add_entity(entity)
    raise 'Cannot add entity that doesnt have a position' unless entity.has? :position
    @entities << entity
  end

  def width
    @width
  end

  def height
    @height
  end

  def free(x, y)
    tile = at(x, y)
    if tile.respond_to?(:has?)
      return(tile.has?(:walkable) and tile.get(:walkable).walkable)
    else
      return tile[:walkable]
    end
  end

  private
  def key_for(x, y)
    "#{x},#{y}"
  end

  def tile_for_height(height)
    v = (height).floor
    t = '.'
    t = '#' if v == 1

    c = :white

    { char: t, color: c, walkable: (t == '.') }
  end

end
