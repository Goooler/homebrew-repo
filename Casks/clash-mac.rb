cask "clash-mac" do
  version "1.1.19"

  on_arm do
    sha256 "90af76ce5216d03bfd1a0212ecc2be43912c45ed3655165f57308ad7ac7dbb5b"

    url "https://github.com/666OS/ClashMac/releases/download/v#{version}/ClashMac-v#{version}-macos-arm64.zip"

    app "ClashMac-v#{version}-macos-arm64/ClashMac.app"
  end
  on_intel do
    sha256 "57c7bc732173d9ad1a209328ffb9d5d28c2f51154fa31e42e52ec1608f127206"

    url "https://github.com/666OS/ClashMac/releases/download/v#{version}/ClashMac-v#{version}-macos-x86_64.zip"

    app "ClashMac-v#{version}-macos-x86_64/ClashMac.app"
  end

  name "ClashMac"
  desc "Lightweight macOS Clash Menu Bar Client"
  homepage "https://github.com/666OS/ClashMac"
end
