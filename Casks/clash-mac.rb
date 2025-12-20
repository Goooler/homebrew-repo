cask "clash-mac" do
  version "1.1.20"

  on_arm do
    sha256 "9955550a1624edf3f1498fb8846c350e8ef9f2f207d1799e0b1329330c56aef8"

    url "https://github.com/666OS/ClashMac/releases/download/v#{version}/ClashMac-v#{version}-macos-arm64.zip"

    app "ClashMac-v#{version}-macos-arm64/ClashMac.app"
  end
  on_intel do
    sha256 "4cd820b5bc1d865fcd5c3c077c3cf52266785b56c4acc58d0cb38126e140c2c8"

    url "https://github.com/666OS/ClashMac/releases/download/v#{version}/ClashMac-v#{version}-macos-x86_64.zip"

    app "ClashMac-v#{version}-macos-x86_64/ClashMac.app"
  end

  name "ClashMac"
  desc "Lightweight macOS Clash Menu Bar Client"
  homepage "https://github.com/666OS/ClashMac"
end
