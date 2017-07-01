#!/usr/bin/rake
# Reference https://github.com/krzysztofzablocki/Sourcery/blob/master/Rakefile

require './models/version'
require 'semantic'

### HELPERS ###

VERSION_MUSTACHE_PATH = "Sources/xcodeprojlint/Version.mustache"
VERSION_SWIFT_PATH = "Sources/xcodeprojlint/Version.swift"

def generate_version_swift(version)
  version = Version.new(version)
  version.template_file = VERSION_MUSTACHE_PATH
  output = version.render
  File.open(VERSION_SWIFT_PATH, 'w') { |file| file.write(output) }
end

def bump_version
  last_tag = `git describe --abbrev=0 --tags`
  current_version = Semantic::Version.new last_tag
  new_version = current_version.increment! :patch
  generate_version_swift new_version.to_s
  new_version
end

### RAKE TASKS ###

desc "Removes the build folder"
task :clean do
  puts "> Cleaning build/ folder"
  `rm -rf build`
end

task :release do
  output = `git status -s`
  puts output.empty?
  # puts "> Commiting and tagging with #{new_version}"
  # `git add #{VERSION_SWIFT_PATH}`
  # `git commit -m "Bump version to #{new_version}"`
  # `git tag #{new_version}`
end
