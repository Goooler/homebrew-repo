cask "clash-mac" do
  arch arm: "arm64", intel: "x86_64"

  version "1.4.3"
  sha256 arm:   "f64b65dffff0255f94fe6152cb64d3588d9f871cc5c268010cad8d187b918d08",
         intel: "cc7e4e5b67df030009ea25ab0bd9feede4947782b15244e2e8c25daa4c6459ea"

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
