cask "clash-mac" do
  arch arm: "arm64", intel: "x86_64"

  version "1.3.2"
  sha256 arm: "6d4c73c991e06f1643412d8cf5feee29984d7803e28f9a77d15fcb36c5fb4495",
         intel: "8b872451cba5104f9879d237c9b1be1b063d2c6430195793be1f90a57a9e7439"

  app "ClashMac-v#{version}-macos-#{arch}/ClashMac.app"
  url "https://github.com/666OS/ClashMac/releases/download/v#{version}/ClashMac-v#{version}-macos-#{arch}.zip"
  name "ClashMac"
  desc "Lightweight Clash Menu Bar Client"
  homepage "https://github.com/666OS/ClashMac"

  depends_on macos: ">= :monterey"

  postflight do
    # Informative message for users during installation
    puts "Run `xattr -cr /Applications/ClashMac.app` for the APP, see more details in https://github.com/666OS/ClashMac/blob/main/README.md#solutions."

    # TODO: https://github.com/666OS/ClashMac/blob/main/README.md#solutions
    system_command "/usr/bin/xattr", args: ["-cr", "#{appdir}/ClashMac.app"], sudo: false
  end
end
