cask "fl-clash" do
  arch arm: "arm64", intel: "amd64"

  version "0.8.96"
  sha256 arm:   "f0d3d6f4d381ec2a9c05850b076b51ea796d335296ba1aa56388d105ec0d90c0",
         intel: "a687d78658d3ea23f5cd6a7691679a02ad656ccdf41c811aea1fd49c317886b8"

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
