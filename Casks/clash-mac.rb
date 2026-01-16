cask "clash-mac" do
  arch arm: "arm64", intel: "x86_64"

  version "26.5"
  sha256 arm:   "32a2122d02ea53379ff3681d3dfa440b33bca2e5153b47c7053ece9da535aaa1",
         intel: "18c073348dd440a51ba9556bf154c3364b32e704ec50eb7d8ec8774453a878be"

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
