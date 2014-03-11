class HealthComponent
  def initialize(parent, max)
    raise 'Cannot create health component when parent is nil' unless parent
    raise 'Cannot create health component when max value is nil' unless max

    @parent = parent
    @max = max
    @current = max
  end

  def id
    :health
  end

  def set(health)
    @current = health
  end

  def current
    @current
  end

  def max
    @max
  end

end
