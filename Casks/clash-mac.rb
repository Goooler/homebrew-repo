cask "clash-mac" do
  arch arm: "arm64", intel: "x86_64"

  version "26.6"
  sha256 arm:   "9fcc25421a91bf0df8f4bf7c48665ae7ac5a9e5f351a90a1e233ccf38d6435e3",
         intel: "2c50019f44dbeb0109be01655f50d6fbe192ed64cef79ab1745230a874789aaf"

  url "https://github.com/666OS/ClashMac/releases/download/#{version}/ClashMac-#{version}-macos-#{arch}.zip"
  name "ClashMac"
  desc "Lightweight Clash Menu Bar Client"
  homepage "https://github.com/666OS/ClashMac"

  depends_on macos: ">= :ventura"

  app "ClashMac-#{version}-macos-#{arch}/ClashMac.app"

  postflight do
    # Informative message for users during installation
    puts "Run `xattr -cr /Applications/ClashMac.app` for the APP, see more details in https://github.com/666OS/ClashMac/blob/main/README.md#solutions."

    system_command "/usr/bin/xattr", args: ["-cr", "#{appdir}/ClashMac.app"], sudo: false
  end

  zap trash: [
    "~/Library/Application Support/clashmac",
    "~/Library/Caches/app.clashmac.ClashMacDashboard",
    "~/Library/Caches/lv.llv.ClashMac",
    "~/Library/Logs/ClashMac",
    "~/Library/Preferences/app.clashmac.ClashMacDashboard.plist",
    "~/Library/Preferences/lv.llv.ClashMac.plist",
    "~/Library/Saved Application State/lv.llv.ClashMac.savedState",
    "~/Library/WebKit/lv.llv.ClashMac",
  ]
end
