# xclint

<a href="https://travis-ci.org/carambalabs/xclint">
    <img src="https://travis-ci.org/carambalabs/xclint.svg?branch=master">
</a>
<a href="https://swift.org/package-manager">
    <img src="https://img.shields.io/badge/spm-compatible-brightgreen.svg?style=flat" alt="Swift Package Manager" />
</a>
<a href="https://twitter.com/xcodedotswift">
    <img src="https://img.shields.io/badge/contact-@xcodedotswift-blue.svg?style=flat" alt="Twitter: @xcodedotswift" />
</a>
<a href="https://codecov.io/gh/carambalabs/xcodeproj">
  <img src="https://codecov.io/gh/carambalabs/xcodeproj/branch/master/graph/badge.svg" alt="Codecov" />
</a>
<a href="https://opensource.org/licenses/MIT">
  <img src="https://img.shields.io/badge/License-MIT-yellow.svg" alt="License" />
</a>

`xclint` is a command line tool written in Swift that validates the state of your Xcode Project. It's able to find duplicated and missing files, inconsistencies between the groups and the folders in your system...

## Install

You can easily install xclint with Homebrew:

```
brew tap xcodeswift/xclint git@github.com:xcodeswift/xclint.git
brew install xclint
```

You can also easily run the tool using [🌱 Mint](https://github.com/yonaskolb/mint):

```bash
mint run xcodeswift/xclint
```

## Setup

1. Git clone the repository `git clone git@github.com:xcodeswift/xclint.git`
2. Build with `swift build`


### How to use it

```bash
xclint MyProject.xcodeproj
```

### References

- [Rainbow](https://github.com/onevcat/Rainbow)
- [Commander](https://github.com/kylef/Commander.git)
