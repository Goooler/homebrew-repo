cask "clash-mac" do
  arch arm: "arm64", intel: "x86_64"

  version "26.4"
  sha256 arm:   "329e73ba8aed307dc16849e0ace880417185b79b17a1dcf5b4438ae43f34f172",
         intel: "97bf7649acd48666db8a58c04194b218041180e0c3ad3906ee672cbc515d9d1d"

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
