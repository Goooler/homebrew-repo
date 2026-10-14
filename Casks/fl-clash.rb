cask "fl-clash" do
  arch arm: "arm64", intel: "amd64"

  version "0.9.0"
  sha256 arm:   "9e5048a53b0b7a327847fb6c6dfc95c10fc39eb21c25879196a3a27fa5b02a80",
         intel: "a35fcdd74030f15695f34c72fe54f82f58126ba09658bbfe13313acceb438440"

  url "https://github.com/chen08209/FlClash/releases/download/v#{version}/FlClash-#{version}-macos-#{arch}.dmg"
  name "FlClash"
  desc "Multi-platform proxy client based on ClashMeta"
  homepage "https://github.com/chen08209/FlClash"

  # Exclude pre-releases like v0.8.92-pre.1
  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :monterey

  app "FlClash.app"

  zap trash: [
    "~/Library/Application Support/com.follow.clash",
    "~/Library/Caches/com.follow.clash",
    "~/Library/Logs/com.follow.clash",
    "~/Library/Preferences/com.follow.clash.plist",
    "~/Library/Saved Application State/com.follow.clash.savedState",
    "~/Library/WebKit/com.follow.clash",
  ]
end
