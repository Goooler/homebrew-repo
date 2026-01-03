cask "clash-mac" do
  arch arm: "arm64", intel: "x86_64"

  version "1.4.13"
  sha256 arm:   "638d0027b9d851cfa7f718408aa570ba6341c09a656ea1a446a9de140ea24521",
         intel: "5721ea71587c8d4994e1927db5ed4a77b7bd25df0b54203a93c4497cf885ed94"

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
