cask "clash-mi" do
  version "1.0.16.211"
  sha256 "424ed752e7d300d211961afaf8183827a268aa76d9b4e85720d63b25c4c5fb6e"

  url "https://github.com/KaringX/clashmi/releases/download/v#{version}/clashmi_#{version}_macos_universal.dmg"
  name "Clash Mi"
  desc "Another Mihomo GUI based on Flutter"
  homepage "https://github.com/KaringX/clashmi"

  livecheck do
    url :url
    # Exclude pre-releases like v1.0.16.200
    strategy :github_latest do |json|
      version = json["tag_name"]&.delete_prefix("v")

      # TODO: https://github.com/KaringX/clashmi/issues/305
      version == "1.0.17.300" ? nil : version
    end
  end

  depends_on macos: ">= :monterey"

  app "Clash Mi.app"

  zap trash: [
    "~/Library/Application Support/clashmi",
    "~/Library/Caches/com.nebula.clashmi",
    "~/Library/Preferences/com.nebula.clashmi.plist",
    "~/Library/Saved Application State/com.nebula.clashmi.savedState",
    "~/Library/WebKit/com.nebula.clashmi",
  ]
end
