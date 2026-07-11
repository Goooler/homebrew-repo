cask "clash-bar" do
  arch arm: "apple-silicon", intel: "intel"

  version "0.3.1"
  sha256 arm:   "30d3a66a39a51b13673cf88f5961a19bba3045ebe4a984637a12c30a1926a493",
         intel: "4e2d01b864c565a6cca971263674cd3b0a98b765acf5f7ca80d232c7b611e1bd"

  url "https://github.com/Sitoi/ClashBar/releases/download/v#{version}/ClashBar-#{version}-#{arch}.dmg"
  name "ClashBar"
  desc "Menu bar proxy client based on Mihomo"
  homepage "https://github.com/Sitoi/ClashBar"

  depends_on macos: :ventura

  app "ClashBar.app"

  postflight do
    # Informative message for users during installation
    puts "Run `xattr -cr /Applications/ClashBar.app` for the APP, see more details in https://github.com/Sitoi/ClashBar?tab=readme-ov-file#-%E5%B8%B8%E8%A7%81%E9%97%AE%E9%A2%98."

    system_command "/usr/bin/xattr", args: ["-cr", "#{appdir}/ClashBar.app"], sudo: false
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
