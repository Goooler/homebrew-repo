cask "clash-mac" do
  arch arm: "arm64", intel: "x86_64"

  version "1.3.4"
  sha256 arm:   "7b24e4e9ce249049ac6d44fb358f0d722523d79bda82b006a33c12da9aed9fa8",
         intel: "6dee44b76dc420642236bf28e6f95c4703641b42040f38ac985d2d72ed95678d"

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
