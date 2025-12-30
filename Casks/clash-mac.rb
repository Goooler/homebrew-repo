cask "clash-mac" do
  arch arm: "arm64", intel: "x86_64"

  version "1.3.6"
  sha256 arm:   "78ca4e0b7f5ac27c47e71547a2958be3047df0acc6165a9b15c7039ab3792e85",
         intel: "a31c52abd73ac9a924d9a711604074a8a663dae5162f01942a975c85b8d6866d"

  url "https://github.com/666OS/ClashMac/releases/download/v#{version}/ClashMac-v#{version}-macos-#{arch}.zip"
  name "ClashMac"
  desc "Lightweight Clash Menu Bar Client"
  homepage "https://github.com/666OS/ClashMac"

  depends_on macos: ">= :monterey"

  app "ClashMac-v#{version}-macos-#{arch}/ClashMac.app"

  postflight do
    # Informative message for users during installation
    puts "Run `xattr -cr /Applications/ClashMac.app` for the APP, see more details in https://github.com/666OS/ClashMac/blob/main/README.md#solutions."

    # TODO: https://github.com/666OS/ClashMac/blob/main/README.md#solutions
    system_command "/usr/bin/xattr", args: ["-cr", "#{appdir}/ClashMac.app"], sudo: false
  end
end
