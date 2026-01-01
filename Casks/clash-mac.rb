cask "clash-mac" do
  arch arm: "arm64", intel: "x86_64"

  version "1.4.1"
  sha256 arm:   "7bfb8ae302df849d8b182a77301b0a66f21efb730f319cc037b10a73892dd574",
         intel: "b9a26ddcee30f2745a2741322988d21c28001102af9f17a00e834cb4cdebb112"

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
