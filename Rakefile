#!/usr/bin/rake
# Reference https://github.com/krzysztofzablocki/Sourcery/blob/master/Rakefile

require './models/version'

### HELPERS ###

def generate_version_swift(version)
  version = Version.new(version)
  version.template_file = "Sources/xcodeprojlint/Version.mustache"
  output_path = "Sources/xcodeprojlint/Version.swift"
  output = version.render
  File.open(output_path, 'w') { |file| file.write(output) }
end

### RAKE TASKS ###

desc "Removes the build folder"
task :clean do
  puts "> Cleaning build/ folder"
  `rm -rf build`
end

desc "Bumps the version, generating a new Version.swift and tagging the version on git"
task :bump_version do
  # TODO
end

task :release do
end
