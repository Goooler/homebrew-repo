cask "clash-bar" do
  arch arm: "apple-silicon", intel: "intel"

  version "0.0.5"
  sha256 arm:   "31a69919ad78a9565c666e05d172a2920a959038158d128e8ba8cac1bdad46b2",
         intel: "8d534b898283c7f89a8112828f39cc3df19d8f21a3ae5c9add8787ad2228a937"

  url "https://github.com/Sitoi/ClashBar/releases/download/v#{version}/ClashBar-#{version}-#{arch}.dmg"
  name "ClashBar"
  desc "Menu bar proxy client based on Mihomo"
  homepage "https://github.com/Sitoi/ClashBar"

  depends_on macos: ">= :sonoma"

  app "ClashBar.app"

  postflight do
    system_command "/usr/bin/xattr", args: ["-cr", "#{appdir}/ClashBar.app"], sudo: false
    ohai "ClashBar is not notarized by Apple. The quarantine attribute has been removed to allow it to open."
    ohai "If macOS still prevents opening it, go to System Settings > Privacy & Security and click \"Open Anyway\"."
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
end
