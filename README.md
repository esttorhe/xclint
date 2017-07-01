# xcodeprojlint

<a href="https://travis-ci.org/carambalabs/xcodeprojlint">
    <img src="https://travis-ci.org/carambalabs/xcodeprojlint.svg?branch=master">
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

`xcodeprojlint` is a command line tool written in Swift that validates the state of your Xcode Project. It's able to find duplicated and missing files, inconsistencies between the groups and the folders in your system...

### Install

You can easily install `xcodeprojlint` with Homebrew:

```bash
brew tap carambalabs/formulae
brew install xcodeprojlint
```

### Contribute

1. Git clone the repository `git@github.com:carambalabs/xcodeprojlint.git`.
2. Install Bundler dependencies `bundle install`.
2. Open `xcodeprojlint.xcodeproj`.

### How to use it

`xcodeprojlint` provides the following commands:

- `lint` lints your xcode project: `xcodeprojlint lint MyProject.xcodeproj`
- `rules` prints all the available linting rules.
- `autocorrect` it tries to correct all the linting issues found.
- `version` it prints the version of `xcodeprojlint` that you are using.


### References

- [Rainbow](https://github.com/onevcat/Rainbow)
- [Commander](https://github.com/kylef/Commander.git)

## About

<img src="https://github.com/carambalabs/Foundation/blob/master/ASSETS/logo-salmon.png?raw=true" width="200" />

This project is funded and maintained by [Caramba](http://caramba.io). We 💛 open source software!

Check out our other [open source projects](https://github.com/carambalabs/), read our [blog](http://blog.caramba.io) or say :wave: on twitter [@carambalabs](http://twitter.com/carambalabs).

## Contribute

Contributions are welcome :metal: We encourage developers like you to help us improve the projects we've shared with the community. Please see the [Contributing Guide](https://github.com/carambalabs/Foundation/blob/master/CONTRIBUTING.md) and the [Code of Conduct](https://github.com/carambalabs/Foundation/blob/master/CONDUCT.md).
