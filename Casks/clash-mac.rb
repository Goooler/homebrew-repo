cask "clash-mac" do
  arch arm: "arm64", intel: "x86_64"

  version "1.4.10"
  sha256 arm:   "1c10f7d047e159a8d13d93abf8f5d1097fbb33b8bf54b9e308e27748ce71de02",
         intel: "9e3839334be89f745e435ff9265625dba9a6d5cc16d9b84f675dc94cb70b52ec"

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
