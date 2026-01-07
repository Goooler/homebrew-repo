cask "clash-mac" do
  arch arm: "arm64", intel: "x86_64"

  version "26.2"
  sha256 arm:   "6343f3d7a0c92f84990729e1ba83df7aa325d5dae6c326f9625f7831afacbd3c",
         intel: "12d351b4d0644c97f72ed4533ac84a6d856bae42122a7b5679fddbe166220be1"

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
