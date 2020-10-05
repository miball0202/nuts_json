require_relative 'lib/nuts_json/version'

Gem::Specification.new do |spec|
  spec.name          = "nuts_json"
  spec.version       = NutsJson::VERSION
  spec.authors       = ["miball0202"]
  spec.email         = ["aisacart@gmail.com"]

  spec.summary       = %q{ This support to create simple json serializer by coding response as hash }
  spec.homepage      = "https://github.com/miball0202/nuts_json"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/miball0202/nuts_json"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
