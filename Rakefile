#!/usr/bin/rake
# Reference https://github.com/krzysztofzablocki/Sourcery/blob/master/Rakefile

require './models/version'
require 'semantic'
require 'colorize'

### HELPERS ###

VERSION_MUSTACHE_PATH = "Sources/xcodeprojlintcommands/Version.mustache"
VERSION_SWIFT_PATH = "Sources/xcodeprojlintcommands/Version.swift"

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

def commit_and_push_version(new_version)
  `git add .`
  `git commit -m "Bump version to #{new_version}"`
  `git tag #{new_version}`
  `git push origin --tags`
end

def build
  sh "swift build"
end

def archive
  `cd .build/debug; tar -cvzf xcodeprojlint.tar.gz xcodeprojlint`
	`mv .build/debug/xcodeprojlint.tar.gz ./xcodeprojlint.tar.gz`
end

def any_git_changes?
  !`git status -s`.empty?
end

def print(message)
  puts message.colorize(:yellow)
end

def generate_docs(version)
  sh "jazzy --clean --module-version #{version}--module xcodeprojlint --xcodebuild-arguments -scheme,xcodeprojlint --skip-undocumented --no-download-badge"
end

### RAKE TASKS ###

desc "Removes the build folder"
task :clean do
  print "> Cleaning build/ folder"
  `rm -rf build`
end

desc "Executes all the validation steps for CI"
task :ci => [:clean] do
  print "> Building the project"
  sh "swift build"
  print "> Executing tests"
  sh "swift test"
  print "> Linting project"
  sh "swiftlint"
end

desc "Bumps the version of xcodeprojlint. It creates a new tagged commit and archives the binary to be published with the release"
task :release => [:clean] do
  abort '> Commit all your changes before starting the release' unless !any_git_changes?
  new_version = bump_version
  print "> Version bumped to #{new_version}"
  build
  print "> xcodeprojlint built"
  archive
  print "> xcodeprojlint archived"
  generate_docs(new_version)
  print "> Documentation generated"
  commit_and_push_version(new_version)
  print "> Commit created and tagged with #{new_version}"
end
