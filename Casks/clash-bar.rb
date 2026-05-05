cask "clash-bar" do
  arch arm: "apple-silicon", intel: "intel"

  version "0.2.4"
  sha256 arm:   "6e470585e2300f970477848bb76cdd8b9b0eadc88c829f0ba8026999860304b3",
         intel: "d0711d527ffade4f043de8d3260b8a2aa90775eefabd7742ad138590dd5b8e43"

  url "https://github.com/Sitoi/ClashBar/releases/download/v#{version}/ClashBar-#{version}-#{arch}.dmg"
  name "ClashBar"
  desc "Menu bar proxy client based on Mihomo"
  homepage "https://github.com/Sitoi/ClashBar"

  depends_on macos: ">= :ventura"

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
