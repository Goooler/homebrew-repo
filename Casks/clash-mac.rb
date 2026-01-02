cask "clash-mac" do
  arch arm: "arm64", intel: "x86_64"

  version "1.4.6"
  sha256 arm:   "dcc0f88e477687b590a1e33aaf0ba6fa94a7433673889d3e79d019ac83b3caaf",
         intel: "3f1501d33a9ee45c7a577583dc61c459d8a8e8cd52ab70a68121fcd26ef3dd05"

  url "https://github.com/666OS/ClashMac/releases/download/v#{version}/ClashMac-v#{version}-macos-#{arch}.zip"
  name "ClashMac"
  desc "Lightweight Clash Menu Bar Client"
  homepage "https://github.com/666OS/ClashMac"

  depends_on macos: ">= :monterey"

  app "ClashMac-v#{version}-macos-#{arch}/ClashMac.app"

  postflight do
    # Informative message for users during installation
    puts "Run `xattr -cr /Applications/ClashMac.app` for the APP, see more details in https://github.com/666OS/ClashMac/blob/main/README.md#solutions."

    system_command "/usr/bin/xattr", args: ["-cr", "#{appdir}/ClashMac.app"], sudo: false
  end
end
