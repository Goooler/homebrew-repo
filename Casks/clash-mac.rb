cask "clash-mac" do
  arch arm: "arm64", intel: "x86_64"

  version "1.3.8"
  sha256 arm:   "6442f5e7e7bcf870772f6ada89e22e6d0c846adf63b570269e1e1968d1688a4f",
         intel: "9c21cb644c65e2c1af28c3bf148b89044efd570be8512a44782e75d0e946b5e0"

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
