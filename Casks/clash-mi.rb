cask "clash-mi" do
  version "1.0.16.211"
  sha256 "424ed752e7d300d211961afaf8183827a268aa76d9b4e85720d63b25c4c5fb6e"

  url "https://github.com/KaringX/clashmi/releases/download/v#{version}/clashmi_#{version}_macos_universal.dmg"
  name "Clash Mi"
  desc "Another Mihomo GUI based on Flutter"
  homepage "https://github.com/KaringX/clashmi"

  # Skip version 1.0.17.300 as it has a misnamed DMG file (clashmi_1.0.16.300 instead of clashmi_1.0.17.300)
  # See: https://github.com/KaringX/clashmi/releases/tag/v1.0.17.300
  livecheck do
    url :url
    regex(/^v?(\d+(?:\.\d+)+)$/i)
    strategy :github_latest do |json, regex|
      match = json["tag_name"]&.match(regex)
      next if match.blank?

      version = match[1]
      # Skip 1.0.17.300 due to incorrect asset filename
      next if version == "1.0.17.300"

      version
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
