class NameComponent
  def initialize(parent, name)
    raise 'Cannot create walkable component when parent is nil' unless parent
    raise 'Cannot create walkable component when name is nil' if name.nil?

    @parent = parent
    @name = name
  end

  def id
    :name
  end

  def set(name)
    @name = name
  end

  def name
    @name
  end

end
