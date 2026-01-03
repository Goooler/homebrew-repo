cask "clash-mac" do
  arch arm: "arm64", intel: "x86_64"

  version "1.4.14"
  sha256 arm:   "1525500e493d8f851fab53f585f56290b605172a969711e04ea076ac405899c1",
         intel: "c523321b0ee8d4c7b22f236934552d97b2c2515e9a1bd531f68ccb8297bf5c6f"

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
