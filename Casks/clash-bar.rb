cask "clash-bar" do
  arch arm: "apple-silicon", intel: "intel"

  version "0.3.4"
  sha256 arm:   "2b4f343f1a93f641b4c52efa09f9a2a189bb843619fba9ea652a7f126ffe3fc7",
         intel: "b410987cb6f923264810787ca3f5ae5a408269eef4c6934a85857ff3740989e2"

  url "https://github.com/Sitoi/ClashBar/releases/download/v#{version}/ClashBar-#{version}-#{arch}.dmg"
  name "ClashBar"
  desc "Menu bar proxy client based on Mihomo"
  homepage "https://github.com/Sitoi/ClashBar"

  depends_on macos: :ventura

  app "ClashBar.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-cr", "{{appdir}}/ClashBar.app"]
  end

  uninstall launchctl: "com.clashbar.helper",
            quit:      "com.clashbar",
            delete:    [
              "/Library/LaunchDaemons/com.clashbar.helper.plist",
              "/Library/PrivilegedHelperTools/com.clashbar.helper",
            ]

  zap trash: [
    "~/Library/Application Support/com.clashbar",
    "~/Library/Caches/com.clashbar",
    "~/Library/Preferences/com.clashbar.plist",
  ]

  caveats <<~EOS
    Run `xattr -cr /Applications/ClashBar.app` for the APP, see more details in https://github.com/Sitoi/ClashBar?tab=readme-ov-file#-%E5%B8%B8%E8%A7%81%E9%97%AE%E9%A2%98.
  EOS
end
