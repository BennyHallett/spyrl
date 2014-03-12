class ArtifactComponent

  def initialize(parent)
    raise 'Cannot create open component when parent is nil' unless parent

    @parent = parent
  end

  def id
    :artifact
  end

  end

end
