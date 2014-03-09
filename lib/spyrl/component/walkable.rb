class WalkableComponent
  def initialize(parent, value)
    raise 'Cannot create walkable component when parent is nil' unless parent
    raise 'Cannot create walkable component when value is nil' if value.nil?

    @parent = parent
    @value = value
  end

  def id
    :walkable
  end

  def set(value)
    @value = value
  end

  def walkable
    @value
  end

end
