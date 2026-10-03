cask "fl-clash" do
  arch arm: "arm64", intel: "amd64"

  version "0.8.99"
  sha256 arm:   "88ae59399ca97b9f682b7b93d7a5c8e9edb8b95fa84cd73b98f21a26bf4de851",
         intel: "9752ebf25fc3d093b9b9abf637366cf60e90b7e8348172a631237c92ffac6879"

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
