# xclint

<a href="https://travis-ci.org/carambalabs/xclint">
    <img src="https://travis-ci.org/carambalabs/xclint.svg?branch=master">
</a>
<a href="https://swift.org/package-manager">
    <img src="https://img.shields.io/badge/spm-compatible-brightgreen.svg?style=flat" alt="Swift Package Manager" />
</a>
<a href="https://twitter.com/carambalabsEng">
    <img src="https://img.shields.io/badge/contact-@carambalabsEng-blue.svg?style=flat" alt="Twitter: @carambalabsEng" />
</a>
<a href="https://codecov.io/gh/carambalabs/xcodeproj">
  <img src="https://codecov.io/gh/carambalabs/xcodeproj/branch/master/graph/badge.svg" alt="Codecov" />
</a>
<a href="https://opensource.org/licenses/MIT">
  <img src="https://img.shields.io/badge/License-MIT-yellow.svg" alt="License" />
</a>

`xclint` is a command line tool written in Swift that validates the state of your Xcode Project. It's able to find duplicated and missing files, inconsistencies between the groups and the folders in your system...


### Install

You can easily install `xclint` with Homebrew:

```bash
brew tap carambalabs/formulae
brew install xclint
```

### Contribute

1. Git clone the repository `git@github.com:carambalabs/xclint.git`.
2. Install Bundler dependencies `bundle install`.
2. Open `xclint.xcodeproj`.

### How to use it

`xclint` provides the following commands:

- `lint` lints your xcode project: `xclint lint MyProject.xcodeproj`
- `rules` prints all the available linting rules.
- `autocorrect` it tries to correct all the linting issues found.
- `version` it prints the version of `xclint` that you are using.

### Documentation
You can check out the documentation on the following [link](https://carambalabs.github.io/xclint/index.html). The documentation is automatically generated in every release by using [Jazzy](https://github.com/realm/jazzy) from [Realm](https://realm.io).

### References

- [Rainbow](https://github.com/onevcat/Rainbow)
- [Commander](https://github.com/kylef/Commander.git)
