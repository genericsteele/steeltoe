$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "steeltoe/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name          = "steeltoe"
  s.version       = Steeltoe::VERSION
  s.authors       = ["Eric Steele"]
  s.email         = ["eric@iamericsteele.com"]
  s.description   = "A flatter style bootstrap for simple projects"
  s.summary       = "I wanted better looking default styles, so I put together a better bootstrap."
  s.homepage      = "https://github.com/genericsteele/steeltoe"
  s.license       = ["MIT", "SIL Open Font License"]

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "railties", ">= 3.2"

  s.add_development_dependency "activesupport"
  s.add_development_dependency "sass-rails"
end
