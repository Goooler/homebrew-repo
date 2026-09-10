cask "fl-clash" do
  arch arm: "arm64", intel: "amd64"

  version "0.8.97"
  sha256 arm:   "90811eb66f362d932117f0a575c3ced39f7e93f363ade4af0066f46e8fc9774b",
         intel: "26002252bec0006dd55d8565e6ea1d99f7365bb7c45babe74c7a119579defe35"

  url "https://github.com/chen08209/FlClash/releases/download/v#{version}/FlClash-#{version}-macos-#{arch}.dmg"
  name "FlClash"
  desc "Multi-platform proxy client based on ClashMeta"
  homepage "https://github.com/chen08209/FlClash"

  depends_on macos: :monterey

  # Exclude pre-releases like v0.8.92-pre.1
  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :big_sur

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
