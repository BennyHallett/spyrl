# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "spyrl"
  spec.version       = '0.0.1'
  spec.authors       = ["roguelike-developer"]
  spec.description   = %q{A roguelike named spyrl}
  spec.summary       = %q{spyrl}

  spec.files         = %w(
bin/spyrl
lib/spyrl/world.rb
lib/spyrl/factory/player.rb
lib/spyrl/screens/game.rb
lib/spyrl/screens/loading.rb
lib/spyrl/screens/title.rb
  )
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_runtime_dependency     "delve", '0.0.8'
end

