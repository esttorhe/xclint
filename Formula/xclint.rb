class Xclint < Formula
  desc "Lint your Xcode projects"
  homepage "https://github.com/xcodeswift/xclint"
  url "https://github.com/xcodeswift/xclint/archive/0.1.0.tar.gz"
  sha256 "aea73e17f38a0286800ee273557d400910b9e15bcb103aa507bcf601ba34585f"
  head "https://github.com/xcodeswift/xclint.git"

  depends_on :xcode => "9.0"

  def install
    xcode_path = "#{buildpath}/.build/release/xclint"
    ohai "Building xcode"
    system("swift build --disable-sandbox -c release")
    bin.install xcode_path
  end

end
