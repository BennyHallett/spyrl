class World

  def initialize(generator, feature_factory, scheduler)
    raise 'Cannot create world when generator is nil' unless generator

    @world = Hash.new
    @entities = Array.new
    @scheduler = scheduler
    @width = generator.width
    @height = generator.height

    total_desks = 10

    generator.generate do |x, y, height|
      @world[key_for(x.floor, y.floor)] = tile_for_height(height)

      add_entity(feature_factory.door(x.floor, y.floor)) if height.floor == 2
    end

    (0..total_desks - 1).each do |i|
      loc = random_free_location
      desk = feature_factory.desk(loc[:x], loc[:y])
      desk.get(:container).put(feature_factory.ruby) if i == 0
      desk.get(:container).put(feature_factory.topaz) if i == 1
      desk.get(:container).put(feature_factory.emerald) if i == 2
      add_entity(desk)
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

  def add_entity(entity, repeat=false)
    raise 'Cannot add entity that doesnt have a position' unless entity.has? :position
    @entities << entity
    @scheduler.add entity, repeat
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

  def random_free_location
    rx = (rand * @width).floor
    ry = (rand * @height).floor

    while !free(rx, ry)
      rx = (rand * @width).floor
      ry = (rand * @height).floor
    end

    { x: rx, y: ry }
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
