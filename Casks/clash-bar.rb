cask "clash-bar" do
  arch arm: "apple-silicon", intel: "intel"

  version "0.0.4"
  sha256 arm:   "2bb9beec528ead4fc5eb609999cf2ab06be6e06e8ed60cccf53e44c7d5c63549",
         intel: "9a68f2814a7ca5a9fb55c429dc5e2502547c69389164d9aa9b13fb271cd8d0d4"

  url "https://github.com/Sitoi/ClashBar/releases/download/v#{version}/ClashBar-#{version}-#{arch}.dmg"
  name "ClashBar"
  desc "Menu bar proxy client based on Mihomo"
  homepage "https://github.com/Sitoi/ClashBar"

  depends_on macos: ">= :sonoma"

  app "ClashBar.app"

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
