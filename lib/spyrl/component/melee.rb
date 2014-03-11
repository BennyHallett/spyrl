class MeleeComponent
  def initialize(parent, damage)
    raise 'Cannot create melee component when parent is nil' unless parent
    raise 'Cannot create melee component when damage is nil' unless damage

    @parent = parent
    @damage = damage
  end

  def id
    :melee
  end

  def attack(target)
    if target.has? :attackable
      target.attacked(@damage)
    end
  end

end
