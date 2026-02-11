cask "clashx-meta" do
  version "1.4.30"
  sha256 "9d5ada66b5f9a9e2635ec60f1b3952fbd2018ed98033484ccaa08130dee6a923"

  url "https://github.com/MetaCubeX/ClashX.Meta/releases/download/v#{version}/ClashX.Meta.zip"
  name "ClashX Meta"
  desc "Rule-based custom proxy with GUI based on Clash.Meta"
  homepage "https://github.com/MetaCubeX/ClashX.Meta"

  depends_on macos: ">= :monterey"

  app "ClashX Meta.app"

  uninstall quit:      "com.metacubex.ClashX",
            launchctl: "com.metacubex.ClashX.ProxyConfigHelper",
            delete:    [
              "/Library/LaunchDaemons/com.metacubex.ClashX.ProxyConfigHelper.plist",
              "/Library/PrivilegedHelperTools/com.metacubex.ClashX.ProxyConfigHelper",
            ]

  zap trash: [
    "~/Library/Application Support/com.metacubex.ClashX.meta",
    "~/Library/Caches/com.metacubex.ClashX.meta",
    "~/Library/Logs/ClashX Meta",
    "~/Library/Preferences/com.metacubex.ClashX.meta.plist",
  ]
end
