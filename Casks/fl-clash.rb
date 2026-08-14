cask "fl-clash" do
  arch arm: "arm64", intel: "amd64"

  version "0.8.95"
  sha256 arm:   "a4e36b64cd4632e362b6867c8a0b0823be3ec31d12cc8a19ae5f448344f7cc2f",
         intel: "76791c65b06a94d30c433cbf5fb36d5686b9f9325bb8710f7c0b039d345fcbc0"

  url "https://github.com/chen08209/FlClash/releases/download/v#{version}/FlClash-#{version}-macos-#{arch}.dmg"
  name "FlClash"
  desc "Multi-platform proxy client based on ClashMeta"
  homepage "https://github.com/chen08209/FlClash"

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
