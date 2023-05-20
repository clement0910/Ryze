# frozen_string_literal: true

require_relative "lib/Ryze/version"

Gem::Specification.new do |spec|
  spec.name = "Ryze"
  spec.version = Ryze::VERSION
  spec.authors = ["Clément Sapt"]
  spec.email = ["clementsapt@gmail.com"]

  spec.summary = "Simple Ruby wrapper for the Riot Games API."
  spec.description = "Ruby wrapper for the Riot Games API. Riot Games API can be found here: https://developer.riotgames.com/apis"
  spec.homepage = "https://github.com/clement0910/Ryze"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/clement0910/Ryze"
  spec.metadata["changelog_uri"] = "https://github.com/clement0910/Ryze/blob/master/CHANGELOG.md"

  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|circleci)|appveyor)})
    end
  end

  spec.require_paths = ["lib"]

  spec.add_dependency "faraday", "~> 2.7.4"
end
