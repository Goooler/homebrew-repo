cask "fl-clash" do
  arch arm: "arm64", intel: "amd64"

  version "0.8.92"
  sha256 arm:   "b2f766927b496b1507323f660999a414e6ab78407693eacbabc2f9fad233469f",
         intel: "e087b913cabb0f81bf374cb50ff98824fcedc125fffd881fcc60ed6f2336eab9"

  url "https://github.com/chen08209/FlClash/releases/download/v#{version}/FlClash-#{version}-macos-#{arch}.dmg"
  name "FlClash"
  desc "Multi-platform proxy client based on ClashMeta"
  homepage "https://github.com/chen08209/FlClash"

  # Exclude pre-releases like v0.8.92-pre.1
  livecheck do
    url :url
    strategy :github_latest
  end

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
