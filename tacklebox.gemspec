require_relative 'lib/tacklebox/version'

Gem::Specification.new do |spec|
  spec.name          = "tacklebox"
  spec.version       = Tacklebox::VERSION
  spec.authors       = ["Juan Palma", "Kevin Counihan", "Armando Mota", "Kayl Thomas"]

  spec.summary       = %q{Tacklebox}
  spec.description   = %q{An open-source serverless framework that offers webhooks as a service.}
  spec.homepage      = "https://github.com/tacklebox-webhooks/ruby"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/tacklebox-webhooks/ruby"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.add_runtime_dependency 'faraday', '~> 1.4', '>= 1.4.1'
  spec.add_runtime_dependency 'json', '~> 2.5', '>= 2.5.1'
end
